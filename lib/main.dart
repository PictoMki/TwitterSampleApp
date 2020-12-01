import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sns_app/page/login_page.dart';
import 'package:sns_app/page/profile_page.dart';
import 'package:sns_app/page/profile_setting_page.dart';
import 'package:sns_app/page/sign_up_page.dart';
import 'package:sns_app/page/start_page.dart';
import 'package:sns_app/page/tab_page_container.dart';
import 'package:sns_app/page/tweet_detail_page.dart';
import 'package:sns_app/page/tweet_page.dart';
import 'package:sns_app/page/user_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/tab_page_container',
      routes: routes,
    );
  }
}

final routes = {
  '/': (context) => Container(), // 必ず必要
  '/start': (context) => StartPage(),
  '/sign_up': (context) => SignUpPage(),
  '/login': (context) => LoginPage(),
  '/profile_setting': (context) => ProfileSettingPage(),
  '/tab_page_container': (context) => TabPagesContainer(
        initialIndex: 0,
      ),
  '/tweet_detail': (context) => TweetDetailPage(),
  '/tweet': (context) => TweetPage(),
  '/profile': (context) => ProfilePage(),
  '/follow_list': (context) => UserListPage(
        userCategory: UserCategory.follow,
      ),
  '/follower_list': (context) => UserListPage(
        userCategory: UserCategory.follower,
      ),
};
