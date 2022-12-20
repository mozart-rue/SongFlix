import 'package:flutter/material.dart';
import 'package:song_flix/Screens/home/widgets/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool reaload = false;
  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
