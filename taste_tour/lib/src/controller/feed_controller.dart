import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taste_tour/src/connect/feed_connect.dart';
import 'package:taste_tour/src/model/feed_model.dart';

final GetStorage _storage = GetStorage();

class FeedController extends GetxController {

  final feedConnection = Get.put(FeedConnect());

  Future readLatestBoard() async {
    try {
      List<dynamic> boards = await feedConnection.readLatestBoard();
      Iterator<dynamic> iterator = boards.iterator;
      List<FeedModel> feeds = [];
      while (iterator.moveNext()) {
        // 각 리스트의 현재 요소 출력
        feeds.add(FeedModel.fromJson(iterator.current));
      }
      return feeds;
    }
    catch(e){
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("$e"),
      ));
      return false;
    }
  }

  Future readPopularBoard() async {
    try {
      List<dynamic> boards = await feedConnection.readPopularBoard();
      Iterator<dynamic> iterator = boards.iterator;
      List<FeedModel> feeds = [];
      while (iterator.moveNext()) {
        // 각 리스트의 현재 요소 출력
        feeds.add(FeedModel.fromJson(iterator.current));
      }
      return feeds;
    }
    catch(e){
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("$e"),
      ));
      return false;
    }
  }

  Future readMyBoard() async {
    try {
      List<dynamic> boards = await feedConnection.readMyBoard();
      Iterator<dynamic> iterator = boards.iterator;
      List<FeedModel> feeds = [];
      while (iterator.moveNext()) {
        // 각 리스트의 현재 요소 출력
        feeds.add(FeedModel.fromJson(iterator.current));
      }
      return feeds;
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("$e"),
      ));
    }
  }

  /**
   * return 잘 등록되면 1
   */
  Future commentCreate(int? boardNumber, String commentContent) async {
    try{
      feedConnection.commentCreate(boardNumber, commentContent).then((result){
        print(result);
        if(result == 1){
          return 1;
        }
        else return 0;
      });

    }
    catch(e){
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("$e"),
      ));
    }
  }
}