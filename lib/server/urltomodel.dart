import 'package:ktube/models/test.dart';
import 'package:ktube/models/videoFeedModel.dart';



List <VideofeedData> urltoModel() {
  List<VideofeedData> videoData = [];
  home_videos.forEach((element) {
    videoData.add(VideofeedData(
        element['thumbnail'],
        element['channelName'],
        element['uploadDate'],
        element['viewCount'],
        element['videoTitle'],
        element['vidoComments'],
        element['videoLikes'],
        element['videoDescriptions'],
        videoUrl: element['videoUrl']));
  });

  return videoData;
}
