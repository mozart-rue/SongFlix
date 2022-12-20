import 'package:flutter/material.dart';
import 'package:song_flix/components/text_form_input.dart';
import 'package:song_flix/config/consts.dart';

class FormInput extends StatelessWidget {
  final String title;
  final String hintText;
  final double height;
  final double width;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const FormInput({
    required this.title,
    required this.width,
    required this.height,
    required this.hintText,
    this.controller,
    this.onChanged,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
          child: Text(
            title,
            style: const TextStyle(
              color: kTextBody,
              fontSize: fsTextH2,
            ),
          ),
        ),
        TextFormInput(
          onChanged: onChanged,
          controller: controller,
          height: height, 
          width: width, 
          hintText: hintText,
        ),
      ],
    );
  }
}

