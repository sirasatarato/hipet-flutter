class Post {
  final String userId;
  final int like;
  final int view;
  final String content;
  final String media;
  final String date;

  Post(this.userId, this.like, this.view, this.content, this.media, this.date);

  factory Post.empty() {
    return Post(
      '',
      0,
      0,
      '',
      '',
      '',
    );
  }

  factory Post.fromJson(Map<String, dynamic> data) {
    return Post(
      data['userUid'],
      data['like'],
      data['view'],
      data['description'],
      data['mediaName'].toString().replaceAll(',', ''),
      data['date'],
    );
  }
}