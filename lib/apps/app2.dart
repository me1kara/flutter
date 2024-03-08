import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/apps/my_large_title.dart';

class App2 extends StatefulWidget {
  const App2({super.key});

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> {
  bool sta = true;

  void toggle() {
    setState(() {
      sta = !sta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
            titleLarge: TextStyle(
          color: Colors.red,
        )),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sta ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggle,
                icon: const Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      ),
    );
  }
}
