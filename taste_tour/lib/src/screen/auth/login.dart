import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/controller/user_controller.dart';
import 'package:taste_tour/src/screen/home.dart';
import 'package:flutter/src/painting/border_radius.dart';

import '../mypage/mypage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userController = Get.put(UserController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  // 로그인 완료 버튼을 누를 때 동작할 함수
  _submitForm() async {
    if (_formkey.currentState!.validate()) {
      final String memberEmail = _emailController.text;
      final String memberPassword = _passwordController.text;
      print("login" + memberEmail + memberPassword);

      // 로그인 통신 로직
      bool result = await userController.login(memberEmail, memberPassword);

      // 로그인 성공시 다음 화면 (메인)으로 이동처리
      if (result) {
        Get.offAll(() => const Home());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Container(
        color: Color.fromRGBO(248, 248, 248, 1),
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: 330,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 7.0,
                          spreadRadius: -8.0,
                          offset: Offset(10.0, 10.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 0, 0, 10),
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    width: 500,
                    child: const Divider(
                      color: Colors.red,
                      thickness: 1.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(255, 99, 99, 1),
                        ),
                        labelText: '이메일',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 165, 165)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 165, 165),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '이메일을 입력하세요.';
                        }
                        if (!emailRegex.hasMatch(value)) {
                          return '이메일 형식이 올바르지 않습니다.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(
                          Icons.lock,
                          color: Color.fromRGBO(255, 99, 99, 1),
                        ),
                        labelText: '비밀번호',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 165, 165)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 165, 165),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 40.0),
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 99, 99, 1),
                      ),
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
