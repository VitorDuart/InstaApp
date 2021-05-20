class Post {
  String id;
  String username;
  String caption;
  String date;
  String location;
  String image;
  List<String> userLiked;
  List<Map<String, dynamic>> userComments;
  String likeds;
  String comments;

  Post({
    this.id,
    this.username,
    this.caption,
    this.date,
    this.image,
    this.userComments,
    this.likeds,
    this.comments,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    caption = json['caption'];
    date = json['date'];
    image = json['image'];
    userLiked = json['userLiked'];
    userComments = json['userComments'];
    likeds = json['likeds'];
    comments = json['comments'];
  }
}
