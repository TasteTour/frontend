import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        const Text(
                          '제목',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
                      padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 99, 99, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const DefaultTextStyle(
                        child: Text(
                          '태그',
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              height: 100,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '5초 전',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 198, 198, 198),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '작성자 : dadat6692',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '댓글 수',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 198, 198, 198),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 198, 198, 198),
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            '조회 수',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 198, 198, 198),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 198, 198, 198),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: const Divider(
            color: Color.fromARGB(255, 234, 234, 234),
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
