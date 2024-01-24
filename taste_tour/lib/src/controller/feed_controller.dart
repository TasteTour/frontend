import 'package:taste_tour/src/connect/feed_connect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/screen/feed/feed_list.dart';
import 'package:taste_tour/src/model/feed_model.dart';

final feedConnect = Get.put(FeedConnect());

class FeedController extends GetxController {
  // 상태관리에서 관리하는 변수
  final feedConnection = Get.put(FeedConnect());

  List<FeedModel> list = [];
  Future readLatestBoard() async {
    try {
      List<dynamic> boards = await feedConnection.readLatestBoard();
      return boards;
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
      return boards;
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

  Future<bool> feedCreate(
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
  }
}
