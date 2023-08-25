import 'package:flutter/material.dart';
import 'package:ktube/models/videoFeedModel.dart';
import 'package:ktube/server/urltomodel.dart';

import 'videocard.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    List <VideofeedData> data = urltoModel();
    return ListView.builder(itemCount: data.length,itemBuilder: (context, index) {
          return VideoCard(data[index]);
        });
  }
}