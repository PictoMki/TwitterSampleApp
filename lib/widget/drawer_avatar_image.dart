import 'package:flutter/material.dart';

class DrawerAvatarImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/avatar.JPG'),
        ),
      ),
    );
  }
}