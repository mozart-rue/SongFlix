import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:song_flix/Screens/listCategories/list_categories.dart';
import 'package:song_flix/api/youtube_api.dart';
import 'package:song_flix/config/consts.dart';
import 'package:song_flix/components/index.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/models/youtube_api_model.dart';
import 'package:song_flix/repositories/videos_repository.dart';
import 'package:song_flix/services/get_video_id.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isRequestingApi = false;

  VideosRepository videosRepository = VideosRepository();

  TextEditingController urlController = TextEditingController();
  CategoriesModel? category;

  onRequestApi(bool state) {
    setState(() => isRequestingApi = state);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Cadastre um vídeo",
                  style: TextStyle(
                    color: kTextBody,
                    fontSize: fsTitleH1,
                  ),
                ),
                SizedBox(height: size.height * 0.06 ),
                FormInput(
                  height: size.height * 0.08,
                  width: size.width * 0.8,
                  hintText: "Insira a url do video",
                  title: "URL:",
                  controller: urlController,
                ),
                SizedBox(height: size.height * 0.04 ),
                RoundedButton(
                  title: 'Add Categoria', 
                  onClick: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const ListCategories()) 
                    ).then((value) {
                      setState(() => category = value);
                    });
                  },
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  backgroundColor: kInputField,
                  radius: 12,
                  fontSize: fsNormal,
                ),
                SizedBox(height: size.height * 0.04 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Preview",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: kTextBody,
                        fontSize: fsTextBig,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => setState(() {}),
                      child: const Icon(
                        PhosphorIcons.arrows_clockwise,
                        color: kHintText,
                      ),
                    ),

                  ],
                ),
                SizedBox(height: size.height * 0.02 ),
                category != null && urlController.text.isEmpty ?
                RoundedButton(title: category!.nameCategory, onClick: (){}, backgroundColor: category!.colorCategory,)
                : category != null && urlController.text.isNotEmpty ?
                VideoItemRecomended(category: category!, videoUrl: urlController.text, videoTitle: "")
                :Image.asset(
                  'assets/images/no_video.png',
                  width: size.width * 0.8,
                ),
                SizedBox(height: size.height * 0.02 ),

                SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kTitulo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                    // cadastrar novo video
                    if (category == null) return;
                    if (urlController.text.isEmpty) return;
                    // transforma o estado da variavel para true
                    onRequestApi(true);

                    String videoId = getVideoId(urlController.text);
                    YoutubeApiModel? youtubeVideoData = await getYouTubeVideoDataById(videoId);

                    if (youtubeVideoData == null) {
                        return;
                    }

                    videosRepository.save(
                        categoryId: category!.categoryId, 
                        urlVideo: urlController.text,
                        youtubeData: youtubeVideoData, 
                      );

                    onRequestApi(false);
                    Navigator.of(context).pop();
                    },
                    child: isRequestingApi 
                    ? SizedBox(
                      width: size.height * 0.015,
                      height: size.height * 0.015,
                      child: const CircularProgressIndicator(
                        color: kHintText,
                        strokeWidth: 3,
                      ),
                    )
                    : const Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: fsNormal,
                        color: kTextBody,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.02 ),
                RoundedButton(
                  title: 'Cancelar', 
                  onClick: (){
                    Navigator.of(context).pop();
                  },
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  backgroundColor: kHintText,
                  radius: 12,
                  fontSize: fsNormal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

