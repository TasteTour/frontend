import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taste_tour/src/connect/feed_connect.dart';
import 'package:taste_tour/src/model/comment_model.dart';
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
    }
  }

  /**
   * return 잘 등록되면 1
   */
  Future commentCreate(int? boardNumber, String commentContent) async {
    try {
      feedConnection.commentCreate(boardNumber, commentContent).then((result) {
        print(result);
        if (result == 1) {
          return 1;
        } else
          return 0;
      });
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
    }
  }

  /**
   * return 잘 등록되면 1
   */
  Future commentRead(int? boardNumber) async {
    try {
      List<dynamic> results = await feedConnection.commentRead(boardNumber);
      Iterator<dynamic> iterator = results.iterator;
      List<CommentModel> comments = [];
      while (iterator.moveNext()) {
        // 각 리스트의 현재 요소 출력
        comments.add(CommentModel.fromJson(iterator.current));
      }
      print(comments);
      await Future.delayed(Duration(seconds: 1));

      return comments;
    }catch(e){
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
      await feedConnection.storeItem(boardTitle, boardStar, boardCategory,
          boardStoreLocation, boardContent,
          imageId: imageId);
      await feedConnection.imageUpload; //이미지 보내기 함수 확인하기
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
    Map data = await feedConnection.imageUpload(name, path);
    return data['id'];
  }
}
