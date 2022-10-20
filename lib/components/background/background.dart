import 'package:flutter/material.dart';
import 'package:song_flix/config/index.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: kBackgroundColor,
      child: child,
    );
  }
}
