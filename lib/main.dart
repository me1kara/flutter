import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen2.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App4());
}

class App4 extends StatelessWidget {
  const App4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: const Homescreen2(),
      ),
    );
  }
}
