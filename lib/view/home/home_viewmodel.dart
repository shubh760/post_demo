import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mock_app_post/model/post_data_model.dart';
import 'package:mock_app_post/service/Api_service.dart';

class HomeViewmodel extends ChangeNotifier {
  List<PostData> dataList = [];
  late ApiService apiService;

  HomeViewmodel() {
    apiService = ApiService(); 
  }

  // Setter for testing purposes
  void setApiService(ApiService service) {
    apiService = service;
  }

   fetchData() async {
    try {
      dataList = await ApiService.getpost();
      log(dataList.toString());
      notifyListeners();
      return dataList;
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
