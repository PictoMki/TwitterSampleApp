import 'package:sns_app/model/user.dart';

class Tweet {
  String id;
  String content;
  User tweetUser;
  DateTime createdAt;
  bool isLiked;

  Tweet({
    this.id,
    this.content,
    this.tweetUser,
    this.createdAt,
    this.isLiked,
  });
}
