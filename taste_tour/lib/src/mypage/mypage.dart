import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬로 변경
            children: [
              // "마이페이지" 헤더
              Text(
                '마이페이지',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16), // 간격 조절

              // 흰색 박스 영역
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "내 정보" 텍스트
                    Text(
                      '내 정보',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20), // 간격 조절

                    // "이름: " 텍스트
                    Text(
                      '이름: 홍길동',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5), // 간격 조절

                    // "이메일: " 텍스트
                    Text(
                      '이메일 : tukorea@tukorea.ac.kr',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5), // 간격 조절

                    // "전화번호: " 텍스트
                    Text(
                      '전화번호: 010-1111-1111',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5), // 간격 조절

                    // "비밀번호: " 텍스트
                    Text(
                      '비밀번호: ******',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
