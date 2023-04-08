import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const idScreen = "mainScreen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rider App"),
      ),
    );
  }
}