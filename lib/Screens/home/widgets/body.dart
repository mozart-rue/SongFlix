import 'package:flutter/material.dart';
import 'package:song_flix/components/index.dart';
import 'package:song_flix/config/index.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    List<String> categorias = [
      "Front End",
      "Mobile",
      "Programação",
      "Data Science"
    ];
    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "SongFlix",
                  style: TextStyle(
                    fontFamily: fTitulo,
                    fontWeight: FontWeight.w400,
                    color: kTitulo,
                    fontSize: fsTitleH1,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/images/Banner.jpg',
                    height: 138,
                    width: 390,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Assista agora",
                      style: TextStyle(
                        fontSize: fsNormal,
                        color: kTextBody,
                      ),
                    ),
                  ),
                ],
              ),
              // ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     shrinkWrap: true,
              //     itemCount: categorias.length,
              //     itemBuilder: (context, index) {
              //       return
              //       Padding(
              //         padding: const EdgeInsets.only(top: 28),
              //         child: RoundedButton(
              //           width: 116,
              //           height: 32,
              //           radius: 12,
              //           onClick: () => print("clickeit "),
              //           title: categorias[index],
              //           fontSize: 16,
              //           backgroundColor: kTitulo,
              //         ),
              //       );
              //     }),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: RoundedButton(
                      width: 116,
                      height: 32,
                      radius: 12,
                      onClick: () => print("clickeit "),
                      title: "teste",
                      fontSize: 16,
                      backgroundColor: kTitulo,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
