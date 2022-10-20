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
                    fontSize: 32,
                  ),
                ),
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Banner.jpg',
                    height: 138,
                    width: 390,
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
