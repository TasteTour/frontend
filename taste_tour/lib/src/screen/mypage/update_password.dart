import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taste_tour/src/controller/user_controller.dart';
import 'package:taste_tour/src/screen/home.dart';

import 'mypage.dart';

class update_password extends StatefulWidget {
  const update_password({super.key});

  @override
  State<update_password> createState() => _update_passwordState();
}

class _update_passwordState extends State<update_password> {
  final userController = Get.put(UserController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _lastMemberPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  // 변경 버튼을 누를 때 동작할 함수
  _submitForm() async {
    if (_formkey.currentState!.validate()) {
      final String lastMemberPassword = _lastMemberPasswordController.text;
      final String memberPassword = _passwordController.text;

      print("updatePassword " + lastMemberPassword + " " + memberPassword);

      // 로그인 통신 로직
      bool result = await userController.updatePassword(lastMemberPassword, memberPassword);
      print(result);

      // 로그인 성공시 다음 화면 (메인)으로 이동처리
      if (result) {
        Get.offAll(() => const mypage());
        // Get.offAll(() => const Home());
        // setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      '비밀번호 변경',
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
                      controller: _lastMemberPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(
                          Icons.lock,
                          color: Color.fromRGBO(255, 99, 99, 1),
                        ),
                        labelText: '현재 비밀번호',
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
                        // 비어있는지 확인
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력하세요.';
                        }
                        // if (!emailRegex.hasMatch(value)) {
                        //   return '이메일 형식이 올바르지 않습니다.';
                        // }
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
                        labelText: '변경할 비밀번호',
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
                        '변경',
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
