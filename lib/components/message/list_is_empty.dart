import 'package:flutter/material.dart';
import 'package:song_flix/config/consts.dart';

class ListIsEmpty extends StatelessWidget {
  const ListIsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        "assets/images/empty.png",
        color: kHintText,
        width: size.width / 4,
      ),
      SizedBox(height: size.height * 0.01,),
      const Text(
        "Sem categorias cadastradas",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kHintText,
          fontSize: fsTextBig,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: size.height * 0.02,),
      const Text(
        "Você ainda não possui categorias cadastradas!\nCadastre uma categoria no botão abaixo",
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
