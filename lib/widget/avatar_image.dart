import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final double size;

  AvatarImage({
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/profile');
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/avatar.JPG'),
          ),
        ),
      ),
    );
  }
}