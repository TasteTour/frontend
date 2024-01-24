import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/model/comment_model.dart';
import 'package:taste_tour/src/model/feed_model.dart';

import '../../controller/feed_controller.dart';
import '../../shared/global.dart';
import 'comment_box.dart';

final FeedController feedController = Get.put(FeedController());

// TODO 사진이 없을 때, 댓글이 없을때 Container 높이 조정
class FeedDetail extends StatefulWidget {
  final FeedModel item;

  const FeedDetail(this.item, {super.key});

  @override
  State<FeedDetail> createState() => _FeedDetailState(this.item);
}

class _FeedDetailState extends State<FeedDetail> {
  final FeedModel item;
  int lengths = 3;
  late Future<dynamic>? myComments;
  _FeedDetailState(this.item);

  @override
  void initState() {
    super.initState();
    // initState에서 비동기 작업을 수행하고 변수에 할당
    myComments = feedController.commentRead(item.boardNumber);
    print(myComments.toString());
  }

  Future<void> _onRefresh() async {
    List<CommentModel> comments = await feedController.commentRead(item.boardNumber);
    setState(() {
      myComments = Future.value(comments);
      lengths = comments.length;
      Get.reloadAll();
      // 상태를 업데이트하여 UI를 갱신
    });
  }


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _commentContentController = TextEditingController();

  void _submitForm() async {
    //현재 폼에서 별다른 오류가 없을때
    if (_formKey.currentState!.validate()) {
      final String commentContent = _commentContentController.text;
      //피드 작성 로직
      await feedController.commentCreate(item.boardNumber, commentContent).then((result){
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text("댓글이 등록되었습니다!"),
        ));
        if (result == 1) {

          initState();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('asset/logo.png', height: 64.0), // 로고 이미지 추가
          centerTitle: true,
        ),
        backgroundColor: Color(0xEAEEEEEE),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: RefreshIndicator(
            onRefresh: _onRefresh,
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
                              Text("${item.boardTitle}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25)),
                              SizedBox(width: 30),
                              Container(
                                padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                                height: 20,
                                width: 60,
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
                            child: Image.network(
                                '${Global.apiRoot}/file/${item.boardNumber}',
                                width: 100,
                                height: 100,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                      'asset/logo.png', width: 100,
                                      height: 100);
                                }
                          ),)
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${item.boardTitle}",
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${item.boardStoreLocation}",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              )
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
                    height: 210,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "댓글 작성하기",
                                    style: TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(width: 120),
                                  ElevatedButton(
                                    onPressed: _submitForm,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffFF6363),
                                    ),
                                    child: const Text(
                                      '등록하기',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Form(key: _formKey, child: Container(
                                width: 311,
                                child: TextFormField(
                                  maxLines: 2,
                                  decoration: InputDecoration(border: OutlineInputBorder()),
                                  controller: _commentContentController,
                                ),
                              ),),
                            ],
                          ),
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
                    height: 380,//((lengths ?? 0) * 80).toInt().toDouble(),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "댓글",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                            future: myComments,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                if (snapshot.hasData) {
                                  List<dynamic> myComment =
                                  snapshot.data as List<dynamic>;
                                  // feedBox (한 페이지에 출력할 글 갯수, 글 List 형태)
                                  return commentBox(5, myComment);
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
                ],
              )
            ]),
          ),
        ));
  }
}
