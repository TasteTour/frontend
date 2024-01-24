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
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
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
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
      return false;
    }
  }

  Future readMyBoard() async {
    try {
      List<dynamic> boards = await feedConnection.readMyBoard();
      print(boards);
      return boards;
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
      return false;
    }
  }

  Future readBoardCategory(boardCategory) async {
    try {
      List<dynamic> boards =
          await feedConnection.readBoardCategory(boardCategory);
      print(boards);
      return boards;
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
      return false;
    }
  }

  /* Future<bool> feedCreate(
      String boardTitle,
      String boardContent,
      String boardStoreLocation,
      String boardCategory,
      double boardStar,
      int? imageId) async {
    try {
      await feedConnect.storeItem(boardTitle, boardStar, boardCategory,
          boardStoreLocation, boardContent,
          imageId: imageId);
      await feedConnect.imageUpload; //이미지 보내기 함수 확인하기
      //await Home(); //이동
      return true;
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
      return false;
    }
  }

//image upload 함수 확인
  Future<int> upload(String name, String path) async {
    Map data = await feedConnect.imageUpload(name, path);
    return data['id'];
  } */
}
