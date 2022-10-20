import 'package:flutter/material.dart';
import 'package:song_flix/Screens/index.dart';
import 'package:song_flix/config/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: fTextBody),
      home: const HomeScreen(),
    );
  }
}
