import 'package:flutter/material.dart';
import 'package:song_flix/components/skelton/load_skelton.dart';

class CardVideoSkelton extends StatelessWidget {
  const CardVideoSkelton({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoadSkelton(
          width: size.width * 0.3, 
          height: 32,
        ),
        SizedBox(height: size.height * 0.01,),
        LoadSkelton(
          width: size.width * 0.9, 
          height: size.height / 3,
        ),
      ],
    );
  }
}

