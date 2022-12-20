import 'package:flutter/material.dart';
import 'package:song_flix/config/consts.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        "assets/images/wrong.png",
        color: kHintText,
        width: size.width / 4,
      ),
      SizedBox(height: size.height * 0.01,),
      const Text(
        "Algo deu errado!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kHintText,
          fontSize: fsTextBig,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: size.height * 0.02,),
      const Text(
        "Por favor tente novamente mais tarde! estamos com problemas para carregar os seus dados :(",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kHintText,
          fontSize: fsText,
          ),
        ),
      ],
    );
  }
}
