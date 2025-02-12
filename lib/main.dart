import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen2.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const App4()); // App4 위젯을 실행시키겠다
}

class App4 extends StatelessWidget {
  // build 메서드를 통해 위젯을 그리겠다
  const App4({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp은 안드
    return MaterialApp(
      home: Container(
        child: Homescreen2(),
      ),
    );
  }
}
