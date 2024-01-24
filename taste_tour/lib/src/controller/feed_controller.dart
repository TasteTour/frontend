import 'package:taste_tour/src/connect/feed_connect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/screen/feed/feed_list.dart';
import 'package:taste_tour/src/model/feed_model.dart';

final feedConnect = Get.put(FeedConnect());

class FeedController extends GetxController {
  // 상태관리에서 관리하는 변수
  List<FeedModel> list = [];

  FeedList() async {
    // FeedConnect를 통해 서버에서부터 List를 가져옴
    List jsonData = await feedConnect.getList();

    // List<Map>을 모델인 List<Model>로 변경!
    List<FeedModel> tmp = jsonData.map((m) => FeedModel.parse(m)).toList();

    // 변경된 tmp를 상태 관리 변수 list 에다가 넣어줌
    list = tmp;

    // UI 업데이트를 알려준다
    update();
  }

  Future<bool> feedCreate(String boardTitle, String boardContent,
      String boardStoreLocation, String boardCategoru, int? imageId) async {
    try {
      await feedConnect.storeItem(
          boardTitle, boardContent, boardStoreLocation, boardCategoru,
          imageId: imageId);
      await feedConnect.imageUpload; //이미지 보내기 함수 확인하기
      await FeedList();
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
