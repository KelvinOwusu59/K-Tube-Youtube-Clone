class VideoData{
  final String videoUrl;
  VideoData({required this.videoUrl});

  factory VideoData.fromJson(Map<dynamic ,dynamic> json){
    return VideoData(videoUrl: json['']);
  }
}


class FilterData{
  final String videoUrl;
  FilterData({required this.videoUrl});

  factory FilterData.fromJson(Map<dynamic ,dynamic> json){
    return FilterData(videoUrl: json['']);
  }
}