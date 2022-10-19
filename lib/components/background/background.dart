import 'package:flutter/material.dart';
import 'package:song_flix/config/index.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: child,
    );
  }
}
