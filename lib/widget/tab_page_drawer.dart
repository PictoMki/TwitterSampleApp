import 'package:flutter/material.dart';
import 'package:sns_app/setting/app_colors.dart';
import 'package:sns_app/widget/avatar_image.dart';

class TabPagesDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarImage(
                  size: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'SNS太郎＠Twitter作成中',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/follow_list');
                  },
                  child: Row(
                    children: [
                      Text(
                        '200',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'フォロー',
                        style: TextStyle(color: AppColors.darkGray),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/follower_list');
                  },
                  child: Row(
                    children: [
                      Text(
                        '300',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'フォロワー',
                        style: TextStyle(color: AppColors.darkGray),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('プロフィールを変更する'),
              onTap: () {
                Navigator.pushNamed(context, '/profile_setting');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('ログアウト'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/start');
              },
            ),
          ],
        ),
      ),
    );
  }
}
