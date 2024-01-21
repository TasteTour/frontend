import 'package:flutter/material.dart';
import 'package:taste_tour/src/screen/auth/login.dart';
import 'package:taste_tour/src/screen/auth/register.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}
