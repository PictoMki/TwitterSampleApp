import 'package:flutter/material.dart';
import 'package:sns_app/setting/app_colors.dart';

class TopTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final List<Color> colors;
  final TabController controller;

  TopTabBar({
    @required this.tabs,
    @required this.controller,
    this.colors,
  });

  @override
  _TopTabBarState createState() => _TopTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _TopTabBarState extends State<TopTabBar>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Color indicatorColor = Colors.orange;

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.darkGray,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        TabBar(
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),
          labelPadding: EdgeInsets.all(0),
          controller: widget.controller,
          indicatorColor: indicatorColor,
          labelColor: AppColors.darkGray,
          tabs: widget.tabs,
        ),
      ],
    );
  }
}
