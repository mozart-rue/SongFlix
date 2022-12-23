
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/models/youtube_api_model.dart';

class VideosModel {
  final String urlVideo;
  final CategoriesModel category;
  final YoutubeApiModel youtubeData;

  VideosModel({
    required this.category,
    required this.urlVideo,
    required this.youtubeData,
  });
}
