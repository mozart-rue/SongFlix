import 'package:flutter/cupertino.dart';
import 'package:song_flix/database/app_database.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/models/videos_model.dart';
import 'package:song_flix/models/youtube_api_model.dart';
import 'package:sqflite/sqflite.dart';

class VideosRepository  {


  Future<int> save({required String categoryId, required String urlVideo, required YoutubeApiModel youtubeData }) async {
    final Database db = await createDatabase();

    /* String dateCleaned = youtubeData.publishedAt.replaceAll("T", " ");
    dateCleaned = dateCleaned.replaceAll("Z", " ");

    final DateTime publishedAt = DateTime.parse(dateCleaned); */

    final Map<String, dynamic> videoMap = {};
    videoMap["category_id"] = categoryId;
    videoMap["url"] = urlVideo;
    videoMap["channel_id"] = youtubeData.channelId;
    videoMap["title"] = youtubeData.videoTitle;
    videoMap["description"] = youtubeData.videoDescription;
    videoMap["published_at"] = youtubeData.publishedAt;


    // Verifi if channel is saved before insert new one
    final List<Map<String, dynamic>> resultChannels = await db.rawQuery("SELECT * FROM channels WHERE id = '${youtubeData.channelId}'");

    if (resultChannels.isEmpty) {
      final Map<String, dynamic> channelMap = {};
      channelMap["id"] = youtubeData.channelId;
      channelMap["name"] = youtubeData.channelName;
      db.insert('channels', channelMap);
    }

    return db.insert('videos', videoMap);
  }


  Future<List<VideosModel>> findVideosWithCategories() async {
    final Database db = await createDatabase();

    // final List<Map<String, dynamic>> result = await db.rawQuery("SELECT v.url as url, c.id as id, c.name as name, c.color as color FROM videos v INNER JOIN categories c ON c.id = v.category_id");
    final List<Map<String, dynamic>> result = await db.rawQuery( ""
      "SELECT " 
        "v.url as url, "
        "v.channel_id as channel_id, "
        "v.title as title, "
        "v.description as description, "
        "v.published_at as publishedAt, "
        "ch.name as channel_name, "
        "c.id as id, "
        "c.name as name, "
        "c.color as color "
      "FROM videos v "
      "INNER JOIN categories c ON c.id = v.category_id "
      "INNER JOIN channels ch ON ch.id = v.channel_id ");

    final List<VideosModel> videosWithCategory = [];

    for (Map<String, dynamic> row in result) {
      final Color categoryColor = Color(row['color']);
      final CategoriesModel category = CategoriesModel(
        categoryId: row['id'], 
        nameCategory: row['name'], 
        colorCategory: categoryColor
      );
      final YoutubeApiModel youtubeData = YoutubeApiModel(
        channelId: row['channel_id'], 
        videoTitle: row['title'], 
        channelName: row['channel_name'], 
        publishedAt: row['publishedAt'], 
        videoDescription: row['description'],
      );
      final VideosModel video = VideosModel(
        urlVideo: row['url'], 
        category: category,
        youtubeData: youtubeData,
      );
      
      videosWithCategory.add(video);
    }
    return videosWithCategory;
  }
}
