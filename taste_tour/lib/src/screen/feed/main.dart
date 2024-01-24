import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/controller/feed_controller.dart';
import 'package:taste_tour/src/screen/feed/latest_feed.dart';
import 'package:taste_tour/src/screen/feed/popularity_feed.dart';
import 'package:taste_tour/src/widget/feed_list_item.dart';
import 'package:taste_tour/src/widget/feed_list_popularity_item.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  get item => null;

  Future<dynamic>? myBoards;

  @override
  void initState() {
    super.initState();
    // initState에서 비동기 작업을 수행하고 변수에 할당
    myBoards = _fetchPopularBoard();
  }

  Future<dynamic> _fetchPopularBoard() async {
    final feedController = Get.put(FeedController());
    final List<dynamic> popularBoards = await feedController.readPopularBoard();

    // popularBoards에서 가장 인기 있는 글 가져오기
    final mostPopularBoard = popularBoards.first;

    return mostPopularBoard;
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
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Column(
                    children: [
                      // TODO 추가하기
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
            FeedListPopularity(item: item),
          ],
        ),
      ),
    );
  }
}
