import 'package:agri/utils/themes.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final Color? color;
  const BackButtonWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          backgroundColor: color ?? ThemeConfig.primary,
          radius: 25,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}