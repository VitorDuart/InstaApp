class Post {
  String id;
  String userId;
  String caption;
  String date;
  List<String> assetsUrl;
  List<String> userLikedUrl;
  List<String> userCommentsUrls;
  String likeds;
  String comments;

  Post({
    this.id,
    this.userId,
    this.caption,
    this.date,
    this.assetsUrl,
    this.userCommentsUrls,
    this.likeds,
    this.comments,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    caption = json['caption'];
    date = json['date'];
    assetsUrl = json['assetsUrl'];
    userLikedUrl = json['userLikedUrl'];
    userCommentsUrls = json['userCommentsUrls'];
    likeds = json['likeds'];
    comments = json['comments'];
  }
}
