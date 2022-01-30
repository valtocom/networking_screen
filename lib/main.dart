import 'package:flutter/material.dart';
import 'package:networking_screen/post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Networking Screen',
      home: PostScreen(
        id: 1,
      ),
    );
  }
}
