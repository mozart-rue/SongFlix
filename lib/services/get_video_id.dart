
String getVideoId(String url) {
  // String urlTeste = "https://www.youtube.com/watch?v=dIyC1CrTSs0";
  List<String> splitedUrl = url.split("v=");

  return splitedUrl[1];
}

