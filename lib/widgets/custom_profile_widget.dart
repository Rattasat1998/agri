import 'package:flutter/material.dart';

class CustomProfileWidget extends StatelessWidget {
  const CustomProfileWidget({
    super.key,
    required this.profileImg,
  });

  final String profileImg;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Image.network(
          profileImg,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                'assets/mockup/profile.png',
                width: 70,
                height: 70,
              ),
            );
          },
        ),
      ),
    );
  }
}