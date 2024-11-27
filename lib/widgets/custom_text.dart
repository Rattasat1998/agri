import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow overflow;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.decoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontSize: fontSize ?? 16,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        overflow: overflow,
        decoration: decoration,
      ),
        maxLines: 4,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}