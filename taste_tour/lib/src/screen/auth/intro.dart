import 'package:flutter/material.dart';
import 'package:taste_tour/src/screen/auth/login.dart';
import 'package:taste_tour/src/screen/auth/register.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/logo.png', width: 200, height: 200),
                    const SizedBox(height: 40),
                    // Container(color: Colors.grey, width: 200, height: 200),
                    const SizedBox(height: 40), //네모랑 글 사이의 간격
                    const Text(
                      '맛탐험 정왕동',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '한국공학대 주변의\n맛집을 공유해보세요. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    //시작하기를 클릭하면  창으로 이동
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF6363),
                  ),
                  child: const Text(
                    '시작하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('이미 계정이 있나요? '),
                  TextButton(
                      onPressed: () {
                        // 로그인을 클릭하면 로그인 창으로 이동
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: const Text('로그인'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
