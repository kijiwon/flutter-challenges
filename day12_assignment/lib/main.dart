import 'package:day12_assignment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:day12_assignment/services/api_service.dart';

void main() {
  ApiService().getPopularMovies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomeScreen(),
    );
  }
}
