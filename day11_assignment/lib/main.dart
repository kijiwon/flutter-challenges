import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 72, 59),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              color: Colors.white,
            ),
          ),
          cardColor: Colors.white),
      home: const Text('home'),
    );
  }
}
