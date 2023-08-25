import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ktube/server/datamodule.dart';


class ApiService{




Future<List<VideoData>> fetchGetData() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {

    print('GET Request Response: ${response.body}');
    final  jsonData = json.decode(response.body);
    final List<dynamic> apiData = jsonData[''];
    final List<VideoData> videoData = [];
    
    for (var element in apiData) {
      videoData.add(element);
    }
    return videoData;
  } else {
    print('GET Request Failed with Status Code: ${response.statusCode}');
    return [];
  }
}

Future<List<FilterData>> fetchFilterGetData() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {

    print('GET Request Response: ${response.body}');
    final  jsonData = json.decode(response.body);
    final List<dynamic> apiData = jsonData[''];
    final List<FilterData> filterData = [];
    
    for (var element in apiData) {
      filterData.add(element);
    }
    return filterData;
  } else {
    print('GET Request Failed with Status Code: ${response.statusCode}');
    return [];
  }
}

Future<void> fetchPostData() async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': 'Flutter HTTP',
      'body': 'Making HTTP requests in Flutter',
      'userId': '1',
    }),
  );

  if (response.statusCode == 201) {
    print('POST Request Response: ${response.body}');
  } else {
    print('POST Request Failed with Status Code: ${response.statusCode}');
  }
}
}