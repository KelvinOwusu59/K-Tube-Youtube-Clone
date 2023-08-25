import 'package:flutter/material.dart';
import 'package:ktube/models/videoFeedModel.dart';

class VideoCard extends StatelessWidget {
  final VideofeedData data;
  VideoCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
               data.thumbnail, // Replace with your video thumbnail URL
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.videoTitle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${data.channelName}  •  ${data.viewCount} views  •  2 days ago', // Replace with actual channel name, views, and upload time
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}