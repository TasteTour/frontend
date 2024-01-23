import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

class mypage extends StatefulWidget {
  const mypage({super.key});

  @override
  State<mypage> createState() => _mypageState();
}

class _mypageState extends State<mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xD3EEEEEE),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text("🏠 마이페이지", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
                const SizedBox(height: 15),
                Container(
                  height: 290,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 10), // changes position of shadow
                    )]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TODO 여기 정보 연동
                        Text("내 정보", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                        const SizedBox(height: 20),
                        Text("이름 : ${_storage.read("memberName")}", style: TextStyle(fontSize: 18),),
                        const SizedBox(height: 13),
                        Text("이메일 : ${_storage.read("memberEmail")}", style: TextStyle(fontSize: 18),),
                        const SizedBox(height: 13),
                        Text("전화번호 : ${_storage.read("memberPhone")}", style: TextStyle(fontSize: 18),),
                        const SizedBox(height: 13),
                        Text("비밀번호 : *********", style: TextStyle(fontSize: 18),),
                        const SizedBox(height: 13),
                        ElevatedButton(
                          // TODO 비밀번호 변경 버튼 연동
                          onPressed: () { },
                          child: Text('비밀번호 변경', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 20),),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffff6363)
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 10), // changes position of shadow
                      )]
                  ),
                )
              ],
            )
          ],
        ),
      )
      
    );
  }
}
