import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taste_tour/src/model/feed_model.dart';

import '../../shared/global.dart';

// TODO 사진이 없을 때, 댓글이 없을때 Container 높이 조정
class FeedDetail extends StatefulWidget {
  final FeedModel item;
  const FeedDetail(this.item, {super.key});

  @override
  State<FeedDetail> createState() => _FeedDetailState(this.item);
}

class _FeedDetailState extends State<FeedDetail> {
  final FeedModel item;
  _FeedDetailState(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xD3EEEEEE),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 15),
                Container(
                  height: 320,
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
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("${item.boardTitle}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                            SizedBox(width: 30),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                              height: 20,width: 60,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 99, 99, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: DefaultTextStyle(
                                child: Text(
                                  '${item.boardCategory}',
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        RatingBar.builder(
                          itemSize: 23,
                          itemBuilder: (Context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                          direction: Axis.horizontal,
                          // 여기에 입력된 평점 수 알려주면 될 듯
                          initialRating: item.boardStar.toDouble(),
                          ignoreGestures: true,
                        ),
                        SizedBox(height: 15),
                        Text("작성자 : ${item.memberName}"),
                        Text("작성 날짜 : ${item.boardCreated}"),
                        SizedBox(height: 15),
                        Text("${item.boardContent}"),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network('${Global.apiRoot}/file/${item.boardNumber}', width: 100, height: 100, errorBuilder: (context, error, stackTrace) {
                            return Image.network('${Global.apiRoot}/file/${item.boardNumber}', width: 100, height: 100);
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 130,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${item.boardTitle}",style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),),
                            SizedBox(height: 10,),
                            Text("${item.boardStoreLocation}",style: TextStyle(fontSize: 15,),)
                          ],
                        ),
                        SizedBox(width: 25),
                        Image.asset('asset/map.png', height: 80.0, width: 80.0),
                      ],
                    ),
                  ),
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
                ),
                SizedBox(height: 30),
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${item.boardTitle}",style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),),
                            SizedBox(height: 10,),
                            Text("${item.boardStoreLocation}",style: TextStyle(fontSize: 15,),)
                          ],
                        ),
                        SizedBox(width: 25),
                        Image.asset('asset/map.png', height: 80.0, width: 80.0),
                      ],
                    ),
                  ),
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
                )
              ],)
          ]
          ),)
    );
  }
}

