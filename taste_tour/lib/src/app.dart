import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/screen/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Home(),
    );
  }
}
