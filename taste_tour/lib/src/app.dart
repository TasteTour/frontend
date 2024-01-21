import 'package:flutter/material.dart';
import 'package:taste_tour/src/screen/auth/intro.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Intro(),
    );
  }
}
