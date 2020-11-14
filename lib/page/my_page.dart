import 'package:flutter/material.dart';
import 'package:sns_app/setting/app_colors.dart';
import 'package:sns_app/widget/avatar_image.dart';
import 'package:sns_app/widget/top_tab_bar.dart';
import 'package:sns_app/widget/tweet_item.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  TabController _homeTabController;
  List<String> item = ["","","","",];

  @override
  void initState() {
    _homeTabController = TabController(
      initialIndex: 0,
      vsync: this,
      length: 2,
    )..addListener(_didChangeHomeTab);
    super.initState();
  }

  @override
  void dispose() {
    _homeTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: AvatarImage(
                        size: 80,
                      ),
                    ),
                    FlatButton(
                      child: Text('変更',style: TextStyle(color: Colors.orange,),),
                      color: Colors.white,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile_setting');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Text('SNS太郎＠Twitter作成中',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                SizedBox(height: 15,),
                Text('Twitter作成中だけど意外と難しい、レイアウト自体を作るのは簡単だけどFirebaseとかも使うとかなり大変'),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on,size: 20,color: AppColors.darkGray),
                        SizedBox(width: 5,),
                        Text('東京',style: TextStyle(color: AppColors.darkGray),),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        Icon(Icons.insert_link,size: 20,color: AppColors.darkGray),
                        SizedBox(width: 5,),
                        InkWell(
                          onTap: () async {
                            final String url = 'https://www.google.com/?hl=ja';
                            try {
                              await canLaunch(url);
                              await launch(url);
                            } catch (error) {
                              print(error);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('URLが有効ではありません。 $url')));
                            }
                          },
                          child: Text('example/xxx/yyyy',style: TextStyle(color: Colors.blueAccent),),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.cake,size: 20,color: AppColors.darkGray),
                    SizedBox(width: 5,),
                    Text('誕生日',style: TextStyle(color: AppColors.darkGray),),
                    SizedBox(width: 15,),
                    Text('1994年12月21日',style: TextStyle(color: AppColors.darkGray),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.calendar_today,size: 20,color: AppColors.darkGray),
                    SizedBox(width: 5,),
                    Text('2010年2月からTwitterを利用しています。',style: TextStyle(color: AppColors.darkGray),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/follow_list');
                      },
                      child: Row(
                        children: [
                          Text('200',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('フォロー',style: TextStyle(color: AppColors.darkGray),),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/follower_list');
                      },
                      child: Row(
                        children: [
                          Text('300',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('フォロワー',style: TextStyle(color: AppColors.darkGray),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          TopTabBar(
            controller: _homeTabController,
            tabs: [
              Tab(
                child: Text(
                  'ツイート',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'YuGothic',
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'いいね',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'YuGothic',
                  ),
                ),
              )
            ],
            colors: [
              Colors.orange,
              Colors.orange,
            ],
          ),
          ListView.builder(
            itemCount: item.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return TweetListItem();
            },
          ),
        ],
      ),
    );
  }

  void _didChangeHomeTab() {
    if (_homeTabController?.indexIsChanging != false) return;
    setState(() {
      item.add("");
    });
  }
}