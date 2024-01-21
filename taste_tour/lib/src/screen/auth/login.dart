import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/controller/user_controller.dart';
import 'package:taste_tour/src/screen/home.dart';

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
      final String email = _emailController.text;
      final String password = _passwordController.text;

      // 로그인 통신 로직
      bool result = await userController.login(email, password);

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
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            const Text(
              '로그인 화면',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: '이메일',
                border: OutlineInputBorder(),
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
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text(
                '로그인',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
