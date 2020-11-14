import 'package:flutter/material.dart';
import 'package:sns_app/widget/user_list_item.dart';

class UserListPage extends StatelessWidget {
  final UserCategory userCategory;

  UserListPage({this.userCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userCategoryToString(userCategory)),
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return UserListItem();
        },
      ),
    );
  }
}

enum UserCategory {
  follow,
  follower,
}

String userCategoryToString(UserCategory userCategory) {
  switch (userCategory) {
    case UserCategory.follow:
      return 'フォロー';
    case UserCategory.follower:
      return 'フォロワー';
  }
  return null;
}

