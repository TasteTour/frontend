import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/screen/feed/category.dart';
import 'package:taste_tour/src/screen/feed/feed_detail.dart';
import 'package:taste_tour/src/screen/feed/main.dart';
import 'package:taste_tour/src/screen/mypage/mypage.dart';

import '../controller/feed_controller.dart';
import 'feed/feed_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final feedController = Get.put(FeedController());
  late Future<dynamic>? myBoards;
  int boardCount = 0;

  @override
  void initState() {
    super.initState();
    // initState에서 비동기 작업을 수행하고 변수에 할당
    myBoards = feedController.readLatestBoard();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('asset/logo.png', height: 64.0), // 로고 이미지 추가
          centerTitle: true,
        ),
        bottomNavigationBar: const SafeArea(
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: '홈'),
              Tab(icon: Icon((Icons.category)), text: '카테고리'),
              Tab(icon: Icon(Icons.location_on_outlined), text: '글 쓰기'),
              Tab(icon: Icon(Icons.person_outline), text: '마이페이지'),
            ],
            labelColor: Color(0xffFF6363), // 선택된 탭의 색상
          ),
        ),
        body: TabBarView(
          children: [
            Main(),
            Category(),
            Center(child: Text('page3')),
            mypage(),
          ],
        ),
      ),
    );
  }
}
