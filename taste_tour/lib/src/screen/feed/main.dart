import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taste_tour/src/screen/feed/latest_feed.dart';
import 'package:taste_tour/src/screen/feed/popularity_feed.dart';
import 'package:taste_tour/src/widget/feed_list_item.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
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
                      Row(
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
                                      const Text(
                                        '작성자',
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
                                      const Text(
                                        '제목',
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
                                        initialRating: 3,
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
                                    child: const DefaultTextStyle(
                                      child: Text(
                                        '내용',
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
                                    child: Image.asset(
                                      'asset/logo.png',
                                      height: 50.0,
                                      width: 50.0,
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
