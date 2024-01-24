import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/screen/feed/feed_box.dart';
import 'package:taste_tour/src/screen/feed/feed_detail.dart';
import 'package:taste_tour/src/screen/feed/latest_feed.dart';
import 'package:taste_tour/src/screen/feed/popularity_feed.dart';
import 'package:taste_tour/src/widget/feed_list_item.dart';

import '../../controller/feed_controller.dart';
import '../../shared/global.dart';

final FeedController feedController = Get.put(FeedController());

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late Future<dynamic>? Boards;
  late Future<dynamic>? popularBoards;

  @override
  void initState() {
    super.initState();
    // initState에서 비동기 작업을 수행하고 변수에 할당
    Boards = feedController.readLatestBoard();
    popularBoards = feedController.readPopularBoard();
    print(Boards.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 242, 242, 242),
        padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  '최신게시글',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LatestFeed()));
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 28, 20, 0),
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: Boards,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              List<dynamic> board =
                              snapshot.data as List<dynamic>;
                              // feedBox (한 페이지에 출력할 글 갯수, 글 List 형태)
                              return feedBox(2, board);
                            } else if (snapshot.hasError) {
                              // 에러 처리
                              return Text('Error: ${snapshot.error}');
                            }
                          }

                          // 로딩 중일 때 반환할 위젯
                          return Column(children: [
                            Container(
                                width: 50, height: 50, child: CircularProgressIndicator())
                          ]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  '인기게시글',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PopularityFeed()));
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 13, 20, 0),
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: popularBoards,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              List<dynamic> board = snapshot.data as List<dynamic>;
                              // feedBox (한 페이지에 출력할 글 갯수, 글 List 형태)
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FeedDetail(board[0])),
                                  );
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset('asset/logo.png',
                                                    height: 30.0, width: 30.0),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Text(
                                                  '${board[0].memberName}',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${board[0].boardTitle}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                RatingBar.builder(
                                                  itemSize: 20,
                                                  itemBuilder: (Context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {},
                                                  direction: Axis.horizontal,
                                                  // 여기에 입력된 평점 수 알려주면 될 듯
                                                  initialRating: board[0].boardStar.toDouble(),
                                                  allowHalfRating: true,
                                                  ignoreGestures: true,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Container(
                                              height: 48,
                                              child: DefaultTextStyle(
                                                child: Text(
                                                  '${board[0].boardContent}',
                                                ),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Image.network(
                                                  '${Global.apiRoot}/file/${board[0].boardNumber}',
                                                  width: 50,
                                                  height: 50,
                                                  errorBuilder: (context, error, stackTrace) {
                                                    return Image.asset(
                                                        'asset/logo.png', width: 50,
                                                        height: 50);
                                                  }
                                              ),
                                            ),
                                            // 자 이제 여러개면 어떻게 되어야할지 생각을 해야겠지?
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 10, 1, 0),
                                            child: Text(
                                              '2024-01-24',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(255, 198, 198, 198),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (snapshot.hasError) {
                              // 에러 처리
                              return Text('Error: ${snapshot.error}');
                            }
                          }

                          // 로딩 중일 때 반환할 위젯
                          return Column(children: [
                            Container(
                                width: 50, height: 50, child: CircularProgressIndicator())
                          ]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
