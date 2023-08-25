import 'package:flutter/material.dart';
import 'package:ktube/models/videoFeedModel.dart';
import 'package:ktube/server/api.dart';
import 'package:ktube/server/datamodule.dart';

import '../server/urltomodel.dart';
import 'filters.dart';
import 'videoViewScreen.dart';
import 'videocard.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();

  late Future <List<VideoData>> _videoData;
    late Future <List<FilterData>> _filterData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    urltoModel();
    _videoData = apiService.fetchGetData();
    _filterData = apiService.fetchFilterGetData();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
      List <VideofeedData> data = urltoModel();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: height * 0.06,
            // color: Colors.blue,
            child: FutureBuilder(
              future: _filterData,
              builder: (context, snapshot) {
              return Filters();
            },)
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(child: FutureBuilder(
          future: _videoData,
          builder: (context, snapshot) {
          return 
         ListView.builder(
          itemCount: data.length,itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  VideoViewSreen(data[index]);
              }));
            },
            child: VideoCard(data[index]));
        });
        },)
        
        )
      ],
    );
  }
}

