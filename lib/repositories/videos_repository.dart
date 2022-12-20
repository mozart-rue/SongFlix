import 'package:flutter/cupertino.dart';
import 'package:song_flix/database/app_database.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/models/videos_model.dart';
import 'package:sqflite/sqflite.dart';

class VideosRepository  {


  Future<int> save({required String categoryId, required String urlVideo }) async {
    final Database db = await createDatabase();

    final Map<String, dynamic> videoMap = {};
    videoMap["category_id"] = categoryId;
    videoMap["url"] = urlVideo;

    return db.insert('videos', videoMap);
  }


  Future<List<VideosModel>> findVideosWithCategories() async {
    final Database db = await createDatabase();

    final List<Map<String, dynamic>> result = await db.rawQuery("SELECT v.url as url, c.id as id, c.name as name, c.color as color FROM videos v INNER JOIN categories c ON c.id = v.category_id");
    final List<VideosModel> videosWithCategory = [];

    for (Map<String, dynamic> row in result) {
      final Color categoryColor = Color(row['color']);
      final CategoriesModel category = CategoriesModel(
        categoryId: row['id'], 
        nameCategory: row['name'], 
        colorCategory: categoryColor
      );
      final VideosModel video = VideosModel(
        urlVideo: row['url'], 
        category: category
      );
      
      videosWithCategory.add(video);
    }
    return videosWithCategory;
  }
}
