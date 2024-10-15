import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mock_app_post/model/comments_model.dart';
import 'package:mock_app_post/service/Api_service.dart';

class PostCardViewmodel extends ChangeNotifier {
  List<CommentData> comments = [];

  void fetchData(int? postId) async {
    if (postId != null) {
      comments.clear();
      try {
        final response = await ApiService.getComments();
        for (var element in response) {
          if (element.postId == postId) {
            comments.add(element);
          }
        }
        notifyListeners();
        log(comments.toString());
        notifyListeners();
      } catch (e) {
        print('Error fetching data: $e');
      }
    }
  }
}
