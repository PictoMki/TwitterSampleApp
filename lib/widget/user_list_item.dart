import 'package:flutter/material.dart';
import 'package:sns_app/widget/avatar_image.dart';

class UserListItem extends StatefulWidget {
  @override
  _UserListItemState createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarImage(size: 50,),
              SizedBox(width: 10,),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('SNS太郎＠Twitter作成中',style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                        Container(
                          width: 120,
                          child: FlatButton(
                            child: isFollow ? Text('フォロー中',style: TextStyle(color: Colors.white,),)  : Text('フォローする',style: TextStyle(color: Colors.orange,),),
                            color: isFollow ? Colors.orange : Colors.white,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            onPressed: () {
                              setState(() {
                                isFollow = !isFollow;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('Twitter作成中だけど意外と難しい、レイアウト自体を作るのは簡単だけどFirebaseとかも使うとかなり大変'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}