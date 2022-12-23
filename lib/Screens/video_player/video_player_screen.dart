import 'package:flutter/material.dart';
import 'package:song_flix/components/index.dart';
import 'package:song_flix/config/index.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/models/videos_model.dart';
import 'package:song_flix/models/youtube_api_model.dart';
import 'package:song_flix/services/get_img_url.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideosModel video;
  const VideoPlayerScreen({
    required this.video,
    Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  
  @override
  Widget build(BuildContext context) {
    CategoriesModel category = widget.video.category;
    YoutubeApiModel youtubeData = widget.video.youtubeData; 
    String urlVideo = widget.video.urlVideo;

    Size size = MediaQuery.of(context).size;
    String imgUrl = getImgUrl(urlVideo);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do video',
          style: TextStyle(
            color: kTextBody,
            fontSize: fsTextBig,
          ),
        ),
        backgroundColor: kTitulo,
      ),
      body: Background(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 32 ),
              GestureDetector(
                child: Image.network(
                  imgUrl,
                  width: size.width * 0.9,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                youtubeData.videoTitle,
                style: const TextStyle(
                  color: kHintText,
                  fontSize: fsTextH2,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundedButton(
                    title: category.nameCategory, 
                    backgroundColor: category.colorCategory,
                    onClick: (){},
                  ),
                  Container(),
                  RoundedButton(
                    title: "Abrir no Youtube", 
                    backgroundColor: Colors.red,
                    onClick: (){},
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
