
class YoutubeApiModel {
  final String  channelId;
  final String channelName;
  final String videoTitle;
  final String videoDescription;
  final String publishedAt;

  YoutubeApiModel({
    required this.channelId,
    required this.videoTitle,
    required this.channelName,
    required this.publishedAt,
    required this.videoDescription,
  });
}
