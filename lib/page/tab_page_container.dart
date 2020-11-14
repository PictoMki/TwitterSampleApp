import 'package:flutter/material.dart';
import 'package:sns_app/page/my_page.dart';
import 'package:sns_app/page/search_page.dart';
import 'package:sns_app/widget/tab_page_drawer.dart';
import 'package:sns_app/page/time_line_page.dart';
import 'package:sns_app/widget/avatar_image.dart';

class TabPagesContainer extends StatefulWidget {
  final int initialIndex;
  TabPagesContainer({
    Key key,
    this.initialIndex,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabPagesContainerState(initialIndex: this.initialIndex);
  }
}

class _TabPagesContainerState extends State<TabPagesContainer>
    with TickerProviderStateMixin {
  int currentIndex;

  _TabPagesContainerState({int initialIndex})
      : currentIndex = initialIndex;

  final _pages = [
    TimeLinePage(),
    SearchPage(),
    MyPage(),
  ];

  List<BottomNavigationBarItem> bottomItem() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home,color: Colors.orange,),
        title: Text('タイムライン',),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        activeIcon: Icon(Icons.search,color: Colors.orange,),
        title: Text('検索',),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person_outline,color: Colors.orange,),
        title: Text('マイページ',),
      ),
    ];
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text('Twitter'),
          leading: Padding(
            padding: EdgeInsets.all(5.0),
            child: InkWell(
              child: AvatarImage(size: 10,),
              onTap: () => _key.currentState.openDrawer(),
            ),
          ),
        ),
        drawer: TabPagesDrawer(),
        body: _pages[currentIndex],
        floatingActionButton: currentIndex == 0 ? FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/tweet',arguments: 'いまなにしてる？');
          },
          child: Icon(Icons.comment),
        ) : Container(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: bottomItem(),
          onTap: (tapIndex) => changeTabPage(tapIndex),
        )
      ),
    );
  }

  void changeTabPage(int selectedIndex) async {
    if (selectedIndex == currentIndex) return;

    setState(() {
      currentIndex = selectedIndex;
    });
  }
}
