import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/controller/feed_controller.dart';
import 'package:taste_tour/src/screen/feed/category.dart';
import 'package:taste_tour/src/screen/feed/create.dart';
import 'package:taste_tour/src/screen/feed/feed_box.dart';
import 'package:taste_tour/src/screen/feed/main.dart';
import 'package:taste_tour/src/screen/mypage/mypage.dart';

class LatestFeed extends StatefulWidget {
  const LatestFeed({super.key});

  @override
  State<LatestFeed> createState() => _LatestFeedState();
}

class _LatestFeedState extends State<LatestFeed> {
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
          title: Image.asset('asset/logo.png', height: 64.0),
          centerTitle: true,
        ),
        bottomNavigationBar: const SafeArea(
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: '홈'),
              Tab(icon: Icon((Icons.category)), text: '카테고리'),
              Tab(icon: Icon(Icons.feed), text: '글 쓰기'),
              Tab(icon: Icon(Icons.person_outline), text: '마이페이지'),
            ],
            labelColor: Color(0xffFF6363),
          ),
        ),
        body: Container(
          color: Color(0xD3EEEEEE),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.8,
              ),
              Text(
                '  최신 게시글',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child: FutureBuilder(
                      future: myBoards,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            List<dynamic> myboard =
                                snapshot.data as List<dynamic>;
                            return feedBox(5, myboard);
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                        }

                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Main(),
                    Category(),
                    Create(),
                    mypage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
