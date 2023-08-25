class VideofeedData {
  final String videoUrl;
  final String thumbnail;
  final String channelName;
  final String  uploadDate;
  final String  viewCount;
  final String videoTitle;
  final  vidoComments;
  final String videoLikes;
  final String videoDescriptions;


  VideofeedData(this.thumbnail, this.channelName, this.uploadDate, this.viewCount, this.videoTitle, this.vidoComments, this.videoLikes, this.videoDescriptions, {required this.videoUrl});
}