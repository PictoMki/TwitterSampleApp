import 'package:flutter/material.dart';
import 'package:sns_app/widget/tweet_item.dart';

class TimeLinePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return TweetListItem();
        },
      ),
    );
  }
}