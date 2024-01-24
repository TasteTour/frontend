import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('asset/logo.png', height: 64.0), // 로고 이미지 추가
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 242, 242, 242),
        padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 여기에 검색창 추가
            const Text(
              '카테고리 선택',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 30, 20, 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                          child: Image.asset(
                            'asset/koreanFood.png',
                            height: 72.0,
                            width: 72.0,
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        TextButton(
                          child: Image.asset(
                            'asset/japaneaseFood.png',
                            height: 72.0,
                            width: 72.0,
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        TextButton(
                          child: Image.asset(
                            'asset/fastFood.png',
                            height: 72.0,
                            width: 72.0,
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        TextButton(
                          child: Image.asset(
                            'asset/chineaseFood.png',
                            height: 72.0,
                            width: 72.0,
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: Image.asset(
                            'asset/westernFood.png',
                            height: 72.0,
                            width: 72.0,
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        TextButton(
                          child: Image.asset(
                            'asset/asianFood.png',
                            height: 72.0,
                            width: 72.0,
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        TextButton(
                          child: Image.asset(
                            'asset/three-dots.png',
                            height: 72.0,
                            width: 72.0,
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
