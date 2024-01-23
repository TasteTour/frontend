import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taste_tour/src/connect/feed_connect.dart';

final GetStorage _storage = GetStorage();

class FeedController extends GetxController {

  final feedConnection = Get.put(FeedConnect());

  Future readLatestBoard() async {
    try {
      List<dynamic> boards = await feedConnection.readLatestBoard();
      return boards;
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
      return boards;
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
      print(boards);
      return boards;
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("$e"),
      ));
      return false;
    }
  }
}