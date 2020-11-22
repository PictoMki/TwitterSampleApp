import 'package:flutter/material.dart';
import 'package:sns_app/widget/avatar_image.dart';

class TweetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String hintText =
        ModalRoute.of(context).settings.arguments.toString() ?? 'いまどうしてる？';

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          Center(
            child: InkWell(
              child: Text(
                '下書き',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              child: Text(
                'ツイートする',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.orange,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.orange),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 0,
              bottom: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarImage(
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 300,
                  height: 300,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    maxLength: 140,
                    maxLines: 10,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
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
