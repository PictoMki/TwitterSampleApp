import 'package:flutter/material.dart';
import 'package:sns_app/widget/user_list_item.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,size: 20,),
              hintText: 'ユーザーを検索',
            ),
            onChanged: (inputText) => {},
          ),
          SizedBox(height: 10,),
          ListView.builder(
            itemCount: 10,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return UserListItem();
            },
          ),
        ],
      ),
    );
  }
}