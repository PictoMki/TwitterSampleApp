import 'package:flutter/material.dart';
import 'package:sns_app/widget/avatar_image.dart';

class ProfileSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("プロフィール"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () => _tapImageButton(),
                      child: AvatarImage(size: 150,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('ユーザー名'),
                  SizedBox(height: 5,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "SNS太郎",
                    ),
                  ),
                ],
              ),
              Container(
                width: 280,
                height: 50,
                child: RaisedButton(
                  child: Text('登録する'),
                  color: Colors.orangeAccent,
                  shape: StadiumBorder(),
                  onPressed: () => _tapRegisterButton(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapImageButton() {

  }

  void _tapRegisterButton(BuildContext context) {
    Navigator.pushNamed(context, '/tab_page_container');
  }
}