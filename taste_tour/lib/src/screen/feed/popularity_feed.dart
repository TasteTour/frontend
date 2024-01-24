import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/controller/feed_controller.dart';
import 'package:taste_tour/src/screen/feed/category.dart';
import 'package:taste_tour/src/screen/feed/feed_box.dart';
import 'package:taste_tour/src/screen/feed/main.dart';
import 'package:taste_tour/src/screen/mypage/mypage.dart';

class PopularityFeed extends StatefulWidget {
  const PopularityFeed({super.key});

  @override
  State<PopularityFeed> createState() => _PopularrityFeedState();
}

class _PopularrityFeedState extends State<PopularityFeed> {
  final feedController = Get.put(FeedController());
  late Future<dynamic>? myBoards;
  int boardCount = 0;

  @override
  void initState() {
    super.initState();
    // initState에서 비동기 작업을 수행하고 변수에 할당
    myBoards = feedController.readPopularBoard();
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
        body: Column(
          children: [
            Text(
              '인기 게시글',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ListView(children: [
              Container(
                color: Color(0xD3EEEEEE),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, 10), // changes position of shadow
                          )
                        ]),
                    // FutureBuilder 비동기 함수를 사용하고 난 후 새로고침을 위한 내용
                    child: FutureBuilder(
                      future: myBoards,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            List<dynamic> myboard =
                                snapshot.data as List<dynamic>;
                            // feedBox (한 페이지에 출력할 글 갯수, 글 List 형태)
                            return feedBox(10, myboard);
                          } else if (snapshot.hasError) {
                            // 에러 처리
                            return Text('Error: ${snapshot.error}');
                          }
                        }

                        // 로딩 중일 때 반환할 위젯
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ),
            ]),
            TabBarView(
              children: [
                Main(),
                Category(),
                Center(child: Text('page3')),
                mypage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
