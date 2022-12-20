import 'package:flutter/material.dart';

class LoadSkelton extends StatelessWidget {
  final double height;
  final double width;
  const LoadSkelton({
    required this.width,
    required this.height,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.08),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
