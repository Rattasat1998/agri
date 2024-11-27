import 'package:agri/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String placeHolder;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLine;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isObscureText;
  final Widget suffixIcon;
  final TextEditingController? controller;
  final Color? borderSideColor;
  final Function()? onTap;
  final bool isEnable;

  const CustomTextFieldWidget({
    super.key,
    required this.placeHolder,
    this.onChanged,
    required this.validator,
    this.maxLength,
    this.maxLine,
    this.keyboardType,
    this.borderSideColor,
    this.obscureText = false,
    this.isObscureText = false,
    this.suffixIcon = const SizedBox(),
    this.controller,
    this.onTap,
    this.isEnable = true,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEnable,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: placeHolder,
        hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.grey),

        suffixIcon: isObscureText ? suffixIcon : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderSideColor ?? ThemeConfig.primary,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderSideColor ?? ThemeConfig.primary,
            width: 2,
          ),
        ),
        focusColor: borderSideColor ??  ThemeConfig.primary,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderSideColor ??  ThemeConfig.primary,
            width: 2,
          ),
        ),
        contentPadding:  EdgeInsets.only(left: borderSideColor != null ? 16 : 20, top: borderSideColor != null ? 16 : 20),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        errorText: null,
      ),
      validator: validator,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: maxLine,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    );
  }
}
