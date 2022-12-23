import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:song_flix/models/youtube_api_model.dart';


Future<YoutubeApiModel?> getYouTubeVideoDataById(String videoId) async {
  String? apiKey = dotenv.env["API_KEY"];

  final String url = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=$videoId&key=$apiKey";
  final Response response = await get(Uri.parse(url)).timeout(const Duration(seconds: 30));

  if(response.statusCode != 200) {
    // Error on request api
      return null;
  }

  final responseDecoded = jsonDecode(response.body);

  final responseItems = responseDecoded["items"];

  if(responseDecoded["pageInfo"]["totalResults"] == 1) {
    Map<String, dynamic>  item = responseItems[0];
    YoutubeApiModel youtubeItem = YoutubeApiModel(
      channelId: item["snippet"]["channelId"], 
      videoTitle: item["snippet"]["title"], 
      channelName: item["snippet"]["channelTitle"], 
      publishedAt: item["snippet"]["publishedAt"], 
      videoDescription: item["snippet"]["description"]
    );
    return youtubeItem;
  }

  // Error more than 1 item in response 
  return null;
}
