import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taste_tour/src/controller/user_controller.dart';
import 'package:taste_tour/src/screen/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final userController = Get.put(UserController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  // 회원가입 완료 버튼을 누를 때 동작할 함수
  void _submitForm() async {
    if (_formkey.currentState!.validate()) {
      final String memberEmail = _emailController.text;
      final String memberPassword = _passwordController.text;
      final String memberName = _nameController.text;
      final String memberPhone = _phoneController.text;
      print(
          "register" + memberName + memberEmail + memberPassword + memberPhone);
      bool result = await userController.register(
          memberName, memberEmail, memberPhone, memberPassword);
      if (result) {
        Get.offAll(() => const Home());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원가입')),
      body: Container(
        color: const Color.fromRGBO(248, 248, 248, 1),
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: 470,
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
                      '회원가입',
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
                    margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
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

                      // 비밀번호 입력되는거 안보이게 하는거
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(
                          Icons.badge,
                          color: Color.fromRGBO(255, 99, 99, 1),
                        ),
                        labelText: '이름',
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: TextFormField(
                      controller: _phoneController,
                      // 이거 어떻게 뜨는지 궁금한데..
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(
                          Icons.phone,
                          color: Color.fromRGBO(255, 99, 99, 1),
                        ),
                        labelText: '전화번호',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 165, 165),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 165, 165),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40.0),
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 99, 99, 1),
                      ),
                      child: const Text(
                        '회원 가입',
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
