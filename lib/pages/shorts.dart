import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import 'video.dart';

class ShortsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('This page is still under development'));
  }
}



class VideoSortsData {
  final String videoUrl;
  final String caption;
  final String username;

  VideoSortsData(
      {required this.videoUrl, required this.caption, required this.username});
}

List<VideoSortsData> videoList = [
  VideoSortsData(videoUrl: src2, caption: 'Video 1', username: 'user1'),
  VideoSortsData(videoUrl: src, caption: 'Video 2', username: 'user2'),
  // Add more video data
];

String src =
    "https://media.istockphoto.com/id/1443889192/video/offshore-wind-farm-south-of-lolland-denmark.mp4?s=mp4-640x640-is&k=20&c=0fKsDPa6C-WE3mEicbbRpKS-7GvpEWwTQJgapkE7XcE=";
String src2 = "'https://www.youtube.com/watch?v=3R6KnQLvZNI'";

class VideoFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      itemBuilder: (context, index) {
        return VideoPage(videoList[index]);
      },
    );
  }
}

class VideoPage extends StatefulWidget {
  final VideoSortsData videoUrl;
  VideoPage(this.videoUrl);
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl.videoUrl));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}