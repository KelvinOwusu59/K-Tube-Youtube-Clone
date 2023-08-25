import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ktube/models/videoFeedModel.dart';
import 'package:ktube/pages/video.dart';

import 'videocard.dart';

class VideoViewSreen extends StatefulWidget {
  final VideofeedData data;
  const VideoViewSreen(this.data,{super.key});

  @override
  State<VideoViewSreen> createState() => _VideoViewSreenState();
}

class _VideoViewSreenState extends State<VideoViewSreen> {
  @override
  Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
    TextStyle style = const  TextStyle(color: Colors.black,fontSize: 16);

return Scaffold(
  appBar: AppBar(
    leading: const BackButton(
    color: Colors.black, // <-- SEE HERE
  ),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    title:  Row(
          children: [
            Icon(Icons.play_circle_outline_outlined,color: Color.fromARGB(255, 83, 75, 114),),
            Text('Ktube',style: style,),
          ],
        ),

           actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              // Implement search functionality here
            },
          ),
             IconButton(
            icon: Icon(Icons.person_4_outlined),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
  ),
  body: Column(
    children: [
      // Container for video
      Container(
        height: height * 0.4,
        color: Colors.black,
        child: VideoPage(widget.data),
      ),
      Expanded(
        child: Container(
          height: height * 0.5,
          // color: Colors.blue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.15,
                  // color: Colors.green,
                  child: _videodataScreen(widget.data),
                ),
                Container(
                  // Use Expanded to allow ListView to take remaining space
                  child: ListView.builder(
                    itemCount: 10, // Example item count
                    shrinkWrap: true, // To prevent height conflicts
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: VideoCard(widget.data),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
 
    ],
  ),
);


  }
Widget _videodataScreen(VideofeedData data){
TextStyle  style2 = const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold);
TextStyle  style3 = const TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w300);

return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text(data.videoTitle,style: style2,),
Text(  '${data.viewCount} views  •  2 days ago',),
ListTile(leading:const Icon(Icons.person),title: Text(data.channelName),trailing: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),child: Text('Subscribe')),)

  ],
);
}
}
