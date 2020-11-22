import 'package:flutter/material.dart';
import 'package:sns_app/setting/app_colors.dart';
import 'package:sns_app/widget/avatar_image.dart';

class TweetListItem extends StatefulWidget {
  @override
  _TweetListItemState createState() => _TweetListItemState();
}

class _TweetListItemState extends State<TweetListItem> {
  bool isLike = false;
  bool isReTweet = false;

  @override
  Widget build(BuildContext context) {
    final BuildContext nowContext = context;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/tweet_detail');
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarImage(
                  size: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'SNS太郎＠Twitter作成中',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('1時間'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Twitter作成中だけど意外と難しい、レイアウト自体を作るのは簡単だけどFirebaseとかも使うとかなり大変'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/tweet',
                                arguments: '返信をツイートする',
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.chat_bubble_outline,
                                    size: 20, color: AppColors.darkGray),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(color: AppColors.darkGray),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 75,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(isReTweet
                                              ? 'リツイートを取り消す'
                                              : 'リツイートする'),
                                          leading: isReTweet
                                              ? Icon(
                                                  Icons.clear,
                                                  color: Colors.red,
                                                )
                                              : Icon(Icons.repeat),
                                          onTap: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              isReTweet = !isReTweet;
                                            });
                                            Scaffold.of(nowContext)
                                                .showSnackBar(SnackBar(
                                                    content: Text(!isReTweet
                                                        ? 'リツイートを取り消しました'
                                                        : 'リツイートしました')));
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                isReTweet
                                    ? Icon(Icons.repeat,
                                        size: 20, color: Colors.greenAccent)
                                    : Icon(Icons.repeat,
                                        size: 20, color: AppColors.darkGray),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  isReTweet ? '13' : '12',
                                  style: TextStyle(color: AppColors.darkGray),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLike = !isLike;
                              });
                            },
                            child: Row(
                              children: [
                                isLike
                                    ? Icon(
                                        Icons.favorite,
                                        size: 20,
                                        color: Colors.redAccent,
                                      )
                                    : Icon(Icons.favorite_border,
                                        size: 20, color: AppColors.darkGray),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  isLike ? '9' : '8',
                                  style: TextStyle(color: AppColors.darkGray),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
