import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taste_tour/src/model/feed_model.dart';

final GetStorage _storage = GetStorage();

class FeedListPopularity extends StatelessWidget {
  final FeedModel item;

  FeedListPopularity({required this.item});

  @override
  Widget build(BuildContext context) {
    final String? boardTitle = item.boardTitle;
    final int? boardStar = item.boardStar;
    final String? boardCategory = item.boardCategory;
    final String? boardStoreLocation = item.boardStoreLocation;
    final String? boardContent = item.boardContent;
    final int? boardViews = item.boardViews;
    final String? boardCreated = item.boardCreated;
    final int? boardComment = item.boardComment;

    return Stack(
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
                                // "${_storage.read("memberName")}",
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
                              Text(
                                "$boardTitle",
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
                                // initialRating: boardStar.toDouble(),
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
                            child: DefaultTextStyle(
                              child: Text(
                                '$boardContent',
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
    );
  }
}
