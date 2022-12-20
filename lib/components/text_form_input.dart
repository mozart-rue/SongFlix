import 'package:flutter/material.dart';
import 'package:song_flix/config/consts.dart';

class TextFormInput extends StatelessWidget {
  final double width;
  final double height;
  final String hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const TextFormInput({
    required this.height,
    required this.width,
    required this.hintText,
    this.onChanged,
    this.controller,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        style: const TextStyle(color: kTextBody),
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const  TextStyle(
            color: kHintText,
            fontSize: fsText,
          ),
          filled: true,
          fillColor: kInputField,
        ),
      ),
    );
  }
}

