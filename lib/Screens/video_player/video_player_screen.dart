import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
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
  bool tappedDescription = false;
  
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
          child: SingleChildScrollView(
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
                Container(
                  width: size.width * 0.9,
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){setState(() => tappedDescription = !tappedDescription);},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * 0.75,
                              child: Text(
                                youtubeData.videoTitle,
                                maxLines: tappedDescription ? 3 :2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kHintText,
                                  fontSize: fsTitleH3,
                                ),
                              ),
                            ),
                            Icon(
                              tappedDescription ? PhosphorIcons.caret_up 
                              : PhosphorIcons.caret_down,
                              color: kHintText,
                            ),
                          ],
                        ),
                      ),
                      /// Just display if tapped on above RoundedButton
                      const SizedBox(height: 24,),
                      !tappedDescription
                      ? Container()
                      :Column(
                        children: [
                          const Text(
                            "Descrição: ",
                            style: TextStyle(
                              color: kHintText,
                              fontSize: fsNormal,
                            ),
                          ),
                          Text(
                            youtubeData.videoDescription,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: kHintText,
                              fontSize: fsText,
                            ),
                          ),
                        ],
                      )
                    ],
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
      ),
    );
  }
}
