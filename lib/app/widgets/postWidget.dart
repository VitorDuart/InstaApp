import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final post;
  PostWidget({this.post});

  @override
  PostWidgetState createState() => PostWidgetState();
}

class PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: widget.post.user.profilePhoto == ''
                          ? Image.asset('assets/images/perfil.jpg').image
                          : Image.network(widget.post.user.profilePhoto).image,
                    ),
                  ),
                ),
                Text(widget.post.user.username),
              ],
            ),
          ),
          Container(
            color: Colors.black26,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.post.image,
            ),
          ),
          Row(
            children: [
              TextButton(
                child: Icon(Icons.favorite_border, color: Colors.black),
                onPressed: () {},
              ),
              TextButton(
                child: Icon(Icons.chat_bubble_outline, color: Colors.black),
                onPressed: () {},
              ),
              TextButton(
                child: Icon(Icons.send_outlined, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          Text(widget.post.userLiked.length > 0
              ? 'Liked by ${widget.post.userLiked[0]} and more ${widget.post.userLiked.length} of people'
              : 'No one liked'),
          Text('${widget.post.user.username} ${widget.post.caption}'),
          TextButton(
            child: Text('View all ${widget.post.userComments.length}'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
