import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/screen/auth/intro.dart';
import 'package:taste_tour/src/screen/feed/category.dart';
import 'package:taste_tour/src/screen/home.dart';

class MyApp extends StatelessWidget {
  final bool isLogin;

  const MyApp(this.isLogin, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Intro(),
    );
  }
}
