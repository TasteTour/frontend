import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taste_tour/src/controller/feed_controller.dart';
import 'package:taste_tour/src/screen/feed/feed_box.dart';
import 'package:taste_tour/src/widget/feed_list_item.dart';

final GetStorage _storage = GetStorage();

class mypage extends StatefulWidget {
  const mypage({super.key});

  @override
  State<mypage> createState() => _mypageState();
}

class _mypageState extends State<mypage> {
  final feedController = Get.put(FeedController());
  late Future<dynamic> ?myBoards;
  int boardCount = 0;

  @override
  void initState() {
    super.initState();
    // initState에서 비동기 작업을 수행하고 변수에 할당
    myBoards = feedController.readMyBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xD3EEEEEE),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "🏠 마이페이지",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 290,
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
                        // TODO 여기 정보 연동
                        Text(
                          "내 정보",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "이름 : ${_storage.read("memberName")}",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 13),
                        Text(
                          "이메일 : ${_storage.read("memberEmail")}",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 13),
                        Text(
                          "전화번호 : ${_storage.read("memberPhone")}",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 13),
                        Text(
                          "비밀번호 : *********",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 13),
                        ElevatedButton(
                          // TODO 비밀번호 변경 버튼 연동
                          onPressed: () {
                            feedController.readMyBoard();
                          },
                          child: Text(
                            '비밀번호 변경',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffff6363)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  height: 700,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "내가 작성한 게시글",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                          const SizedBox(height: 20),
                          FutureBuilder(
                            future: myBoards,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                if (snapshot.hasData) {
                                  List<dynamic> myboard = snapshot.data as List<dynamic>;
                                  return feedBox(5, myboard);
                                } else if (snapshot.hasError) {
                                  // 에러 처리
                                  return Text('Error: ${snapshot.error}');
                                }
                              }

                              // 로딩 중일 때 반환할 위젯
                              return CircularProgressIndicator();
                            },)

                        ]),
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
              ],
            )
          ]),
        ));
  }
}
