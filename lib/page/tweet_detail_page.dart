import 'package:flutter/material.dart';
import 'package:sns_app/setting/app_colors.dart';
import 'package:sns_app/widget/avatar_image.dart';
import 'package:sns_app/widget/tweet_item.dart';

class TweetDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ツイート"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                AvatarImage(size: 50,),
                                SizedBox(width: 5,),
                                Text('SNS太郎＠Twitter作成中',style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text('Twitter作成中だけど意外と難しい、レイアウト自体を作るのは簡単だけどFirebaseとかも使うとかなり大変',style: TextStyle(fontSize: 18,),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text('10:15 2020/11/22'),
                        Divider(),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){},
                              child: Row(
                                children: [
                                  Text('1',style: TextStyle(fontWeight: FontWeight.bold,),),
                                  Text('件のリツイート',style: TextStyle(color: AppColors.darkGray,),),
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){},
                              child: Row(
                                children: [
                                  Text('1',style: TextStyle(fontWeight: FontWeight.bold,),),
                                  Text('件のいいね',style: TextStyle(color: AppColors.darkGray,),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, '/tweet',arguments: '返信をツイート');
                              },
                              child: Icon(Icons.chat_bubble_outline,size: 20,color: AppColors.darkGray,),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Icon(Icons.repeat,size: 20,color: AppColors.darkGray,),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Icon(Icons.favorite_border,size: 20,color: AppColors.darkGray,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return TweetListItem();
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
              child: Row(
                children: [
                  AvatarImage(size: 40,),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      onTap: (){
                        Navigator.pushNamed(context, '/tweet',arguments: '返信をツイート');
                      },
                      decoration: InputDecoration(
                        hintText: '返信をツイート',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}