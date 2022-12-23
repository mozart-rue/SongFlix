import 'dart:math';
import 'package:flutter/material.dart';
import 'package:song_flix/Screens/video_player/video_player_screen.dart';
import 'package:song_flix/components/index.dart';
import 'package:song_flix/config/index.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/models/videos_model.dart';
import 'package:song_flix/repositories/categories_repository.dart';
import 'package:song_flix/repositories/videos_repository.dart';
import 'package:song_flix/services/get_img_url.dart';
import 'package:song_flix/Screens/newVideo/register_new_video.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  CategoriesRepository categoriesRepository = CategoriesRepository();
  VideosRepository videosRepository = VideosRepository();

  List<CategoriesModel> categories = []; 
  bool categoriesLoaded = false;

  List<VideosModel> videos = [];
  bool videosLoaded = false;


  getCategoriesList() async {
    List<CategoriesModel> categoriesDb = await categoriesRepository.findAll();
    setState(() {
      categories = categoriesDb;
      categoriesLoaded = true;
    });
  }

  getVideosWithCategoryList() async {
    List<VideosModel> videosDb = await videosRepository.findVideosWithCategories();
    setState(() {
      videos = videosDb;
      videosLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoriesList();
    getVideosWithCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String randomVideoImageUrl = "";
    if (videos.isNotEmpty) {
      Random random = Random();
      int indexRandom = random.nextInt(videos.length);
      randomVideoImageUrl = getImgUrl(videos[indexRandom].urlVideo);
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const RegisterNewVideo()) 
          ).then((value) {
            getCategoriesList();
            getVideosWithCategoryList();
          });
        },
        backgroundColor: const Color(0xFF7B61FF),
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ),
      body: Background(
        child: Center(
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
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: videos.isEmpty
                  ? Container()
                  : Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        randomVideoImageUrl,
                        height: 138,
                        width: 390,
                        fit: BoxFit.fill,
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
                ),
                SizedBox(
                  width: size.width * 0.9,
                  height: size.height * 0.09,
                  child: !categoriesLoaded
                  ? ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => const CardCategorySkelton()), 
                      separatorBuilder: ((context, index) => SizedBox(width: size.width * 0.02,) ), 
                      itemCount: 5,
                  )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return
                        Padding(
                          padding: const EdgeInsets.only(top: 28, right: 14),
                          child: RoundedButton(
                            // width: 116,
                            height: 32,
                            radius: 12,
                            onClick: () {},
                            title: categories[index].nameCategory,
                            fontSize: 16,
                            backgroundColor: categories[index].colorCategory,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                !videosLoaded
                ? ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => const CardVideoSkelton()), 
                  separatorBuilder: ((context, index) => SizedBox(height: size.height * 0.03)), 
                  itemCount: 5,
                )
                : videos.isEmpty
                ? const VideoListEmpty()
                : Center(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(left: 18),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: videos.length, 
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 12),
                          child: VideoItemRecomended(
                            category: videos[index].category,
                            videoUrl: videos[index].urlVideo, 
                            videoTitle: videos[index].youtubeData.videoTitle,
                            onClick: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => VideoPlayerScreen(video: videos[index]),)
                              );
                            },
                          ),
                        );
                      }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
