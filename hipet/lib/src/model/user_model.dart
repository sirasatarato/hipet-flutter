class UserModel {
  final String name;
  final String uid;
  final String profileImg;
  final int follower;
  final int following;

  UserModel(
    this.name,
    this.uid,
    this.profileImg,
    this.follower,
    this.following,
  );

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      data['name'],
      data['uid'],
      data['profileImg'],
      data['follower'],
      data['following'],
    );
  }
}
