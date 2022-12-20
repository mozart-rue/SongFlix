import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:song_flix/config/consts.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: size.height / 4,),
      LoadingAnimationWidget.staggeredDotsWave(
          color: kHintText, 
          size: size.height * 0.1,
        )
      ],
    );
  }
}
