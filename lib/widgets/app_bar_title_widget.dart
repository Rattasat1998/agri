import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AppBarTitleWidget extends StatelessWidget {
  final String title;
  final Widget? action;
  const AppBarTitleWidget({
    super.key,
    required this.title ,
    this.action,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      color: ThemeConfig.primary,
      child:  Row(
        mainAxisAlignment:action == null ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
        children: [
          CustomText(
            text: title,
            color: Colors.white,
            fontSize: 24,
            textAlign: TextAlign.center,
          ),
          action ?? Container()
        ],
      ),
    );
  }
}
