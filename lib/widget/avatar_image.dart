import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final double size;
  final bool isNavigateProfile;

  AvatarImage({
    @required this.size,
    this.isNavigateProfile = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (isNavigateProfile) {
          Navigator.pushNamed(context, '/profile');
        }
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