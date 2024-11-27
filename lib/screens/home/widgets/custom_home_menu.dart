import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHomeMenu extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconImage;
  final String bg;
  final Color? textColor;
  final Color? subtextColor;
  final bool isBgText;
  final double titleFontSize;
  final double subtitleFontSize;
  final double height;
  final double? width;
  final double imageH;
  final double imageW;
  final double verticalPadding;
  final double horizontalPadding;
  final double marginBottom;
  final Function()? onPressed;

  const CustomHomeMenu({
    super.key,
    required this.title,
    this.subtitle = '',
    this.iconImage = '',
    required this.bg,
    this.textColor,
    this.subtextColor,
    this.isBgText = false,
    this.titleFontSize = 40,
    this.subtitleFontSize = 18,
    this.height = 250,
    this.width,
    this.imageH = 250,
    this.imageW = 250,
    this.verticalPadding = 14,
    this.horizontalPadding = 8,
    this.marginBottom = 50,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isIcon = iconImage != '';
    final isSubtitle = subtitle != '';
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: height,
        width: width ?? MediaQuery.of(context).size.width / 2.05,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Visibility(
              visible: bg != '',
              child: Image.asset(
                bg,
                fit: BoxFit.cover,
                width: width ?? imageH,
                height: imageW,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: marginBottom),
              padding:
                  EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
              decoration: isBgText
                  ? BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(16))
                  : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(visible: isIcon, child: Image.asset(iconImage)),
                  CustomText(
                    text: title,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w900,
                    color: textColor ?? const Color(0xff206102),
                  ),
                  !isSubtitle
                      ? const SizedBox()
                      : CustomText(
                          text: subtitle ?? '',
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: subtextColor ?? Colors.black,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
