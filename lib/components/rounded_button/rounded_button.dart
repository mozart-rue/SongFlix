import 'package:flutter/material.dart';
import '../../config/index.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final double? fontSize;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double radius;
  const RoundedButton(
      {required this.title,
      required this.onClick,
      this.fontSize,
      this.height,
      this.width,
      this.backgroundColor,
      this.radius = 0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: onClick,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: kTextBody,
          ),
        ),
      ),
    );
  }
}
