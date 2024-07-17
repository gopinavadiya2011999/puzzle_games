import 'package:demopuzzle/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() => runApp(const PuzzleGame());

class PuzzleGame extends StatelessWidget {
  const PuzzleGame({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '16 Block Puzzle Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}






