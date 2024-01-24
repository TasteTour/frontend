import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/screen/feed/category.dart';
import 'package:taste_tour/src/screen/feed/feed_box.dart';
import 'package:taste_tour/src/screen/feed/main.dart';

import '../../controller/feed_controller.dart';
import '../mypage/mypage.dart';

class searchFeed extends StatefulWidget {
  final String searchKeyword;
  const searchFeed(this.searchKeyword, {super.key});

  @override
  State<searchFeed> createState() => _searchFeedState(this.searchKeyword);
}

class _searchFeedState extends State<searchFeed> {
  final feedController = Get.put(FeedController());
  late Future<dynamic>? myBoards;
  int boardCount = 0;
  final String searchKeyword;
  _searchFeedState(this.searchKeyword);

  @override
  void initState() {
    super.initState();
    // initState에서 비동기 작업을 수행하고 변수에 할당
    myBoards = feedController.searchBoard(searchKeyword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('asset/logo.png', height: 64.0),
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xD3EEEEEE),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7.8,),
              Text(
                '  검색 게시글',
                style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.bold
                ),
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

                        return Column(children: [
                          const SizedBox(height: 50),
                          Container(
                              width: 50, height: 50, child: CircularProgressIndicator())
                        ]);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
