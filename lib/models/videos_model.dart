
import 'package:song_flix/models/categories_model.dart';

class VideosModel {
  final String urlVideo;
  final CategoriesModel category;

  VideosModel({
    required this.category,
    required this.urlVideo,
  });
}
