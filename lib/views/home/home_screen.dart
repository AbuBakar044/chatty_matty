import 'package:chatty_matty/utils/app_imports.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: MyText(text: 'Home'),
        centerTitle: true,
      ),
    );
  }
}