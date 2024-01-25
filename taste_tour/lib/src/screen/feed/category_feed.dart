import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/controller/feed_controller.dart';
import 'package:taste_tour/src/screen/feed/category.dart';
import 'package:taste_tour/src/screen/feed/feed_box.dart';
import 'package:taste_tour/src/screen/feed/main.dart';
import 'package:taste_tour/src/screen/mypage/mypage.dart';

class CategoryFeed extends StatefulWidget {
  final String boardCategory;

  const CategoryFeed({required this.boardCategory, Key? key}) : super(key: key);

  @override
  State<CategoryFeed> createState() => _CategoryFeedState();
}

class _CategoryFeedState extends State<CategoryFeed> {
  final feedController = Get.put(FeedController());
  late Future<dynamic>? myBoards;
  int boardCount = 0;

  @override
  void initState() {
    super.initState();
    myBoards = feedController.readBoardCategory('${widget.boardCategory}');
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
              Tab(icon: Icon(Icons.location_on_outlined), text: '글 쓰기'),
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
                height: 2.8,
              ),
              Text(
                '   ${widget.boardCategory}',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 600,
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
                          SizedBox(height: 50,),
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
      ),
    );
  }
}
