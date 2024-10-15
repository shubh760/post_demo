import 'package:flutter_test/flutter_test.dart';
import 'package:mock_app_post/service/Api_service.dart';
import 'package:mock_app_post/view/home/home_viewmodel.dart';
import 'package:mock_app_post/model/post_data_model.dart';

// MockApiService with manual mock implementation
class MockApiService extends ApiService {
  @override
  Future<List<PostData>> getpost() async {
    return [
      PostData(id: 1, title: 'Mock Post 1', content: 'Mock Content 1'),
      PostData(id: 2, title: 'Mock Post 2', content: 'Mock Content 2'),
    ];
  }
}

void main() {
  group('HomeViewmodel', () {
    late HomeViewmodel homeViewmodel;
    late MockApiService mockApiService;

    setUp(() {
      homeViewmodel = HomeViewmodel(); // No change to constructor
      mockApiService = MockApiService();
      homeViewmodel.setApiService(mockApiService); // Inject the mock service using setter
    });

    test('fetchData should populate dataList on success', () async {
      // Act
      await homeViewmodel.fetchData();

      // Assert: Ensure the dataList contains the mock data
      expect(homeViewmodel.dataList.length, 2);
      expect(homeViewmodel.dataList[0].title, 'Mock Post 1');
      expect(homeViewmodel.dataList[1].title, 'Mock Post 2');
    });

    test('fetchData should handle exceptions', () async {
      // Mock service with error
      homeViewmodel.setApiService(MockApiServiceWithError());

      // Act
      await homeViewmodel.fetchData();

      // Assert: Ensure the dataList is empty after the failure
      expect(homeViewmodel.dataList.isEmpty, true);
    });
  });
}

// MockApiService that throws an error
class MockApiServiceWithError extends ApiService {
  @override
  Future<List<PostData>> getpost() async {
    throw Exception('Failed to load data');
  }
}
