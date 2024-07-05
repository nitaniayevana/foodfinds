class Post {
  final String userName;
  final String userImage; // URL to network image
  final String postImage;
  int likes;
  int comments;
  bool isLiked;
  final double rating;
  final String location;
  final double latitude;
  final double longitude;
  final String review;
  List<String> commentList;

  Post({
    required this.userName,
    required this.userImage,
    required this.postImage,
    required this.likes,
    required this.comments,
    required this.isLiked,
    required this.rating,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.review,
    this.commentList = const [],
  });
}
