import 'dart:convert';

class Post {
  final String userId;
  final int like;
  final int view;
  final String content;
  final String media;
  final String date;

  Post(this.userId, this.like, this.view, this.content, this.media, this.date);

  factory Post.fromJson(String responseData) {
    Map<String, dynamic> data = jsonDecode(responseData);

    return Post(
      data['userId'],
      data['like'],
      data['view'],
      data['content'],
      data['media'],
      data['date'],
    );
  }
}