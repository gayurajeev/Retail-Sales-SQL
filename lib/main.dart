import 'package:flutter/material.dart';
import 'package:maths_quiz/screens/screen_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xFFFFFFFF),
          scaffoldBackgroundColor: const Color(0xFF111111)),
        home: const ScreenHome(), // Home screen
      ),
    );
  }
}
