import 'package:flutter/material.dart';
import 'package:song_flix/config/consts.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/components/index.dart';
import 'package:song_flix/services/get_img_url.dart';

class VideoItemRecomended extends StatelessWidget {
  final CategoriesModel category;
  final String videoUrl;
  final String videoTitle;
  final void Function()? onClick;
  const VideoItemRecomended({
    required this.category,
    required this.videoUrl,
    required this.videoTitle,
    this.onClick,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String imgUrl = getImgUrl(videoUrl);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedButton(
          height: 32,
          radius: 12,
          onClick: () {},
          title: category.nameCategory,
          fontSize: 16,
          backgroundColor: category.colorCategory,
        ),
        SizedBox(height: size.height * 0.01,),
        GestureDetector(
          onTap: onClick,
          child: Image.network(
            imgUrl,
            width: size.width * 0.9,
          ),
        ),
        Text(
          videoTitle,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            color: kHintText,
            fontSize: fsText,
          ),
        ),
      ],
    );
  }
}

