import 'package:flutter/material.dart';
import 'package:taste_tour/src/screen/mypage/mypage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
        body: const TabBarView(
          children: [
            Center(child: Text('page1')),
            Center(child: Text('page2')),
            Center(child: Text('page3')),
            mypage()
          ],
        ),
      ),
    );
  }
}
