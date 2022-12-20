import 'package:song_flix/services/get_video_id.dart';

String getImgUrl(String url) {
  String idUrl = getVideoId(url);
  String imgUrl = "https://img.youtube.com/vi/$idUrl/0.jpg";

  return imgUrl;
}
