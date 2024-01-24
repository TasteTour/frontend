import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taste_tour/src/app.dart';
import 'package:taste_tour/src/controller/user_controller.dart';

void main() async{
  await GetStorage.init();

  // 초기 화면으로 가고 싶다면, 아래 코드 실행하기
  GetStorage().erase();

  //로그인 여부 (토큰 보유 여부)
  final userController = Get.put(UserController());
  bool isLogin = await userController.isLogin();

  runApp(MyApp(isLogin));
}
