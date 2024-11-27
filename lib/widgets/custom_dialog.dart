import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDialog {
  static void showCustomDialog({
    required BuildContext context,
    required String? title,
    required String description,
    required Widget? icon,
    required Function()? onPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon ?? const SizedBox(),
              CustomText(
                text: description,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.visible,
              ),
             // const SizedBox(height: 20),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: onPressed,
              child: CustomText(
                text: 'ตกลง',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeConfig.primary,
              ),
            ),
          ],

        );
      },
    );
  }
  static void showCustomDeleteDialog({
    required BuildContext context,
    required String title,
    required String description,
    required Widget? icon,
    required Function()? onCancelPressed,
    required Function()? onPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              CustomText(
                text: description,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.visible,
              ),
              Visibility(
                  visible: icon == null,
                  child: SizedBox(height: 20)),
              icon ?? const SizedBox(),
              Visibility(
                  visible: icon == null,
                  child: SizedBox(height: 20)),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: onCancelPressed,
              child: const CustomText(
                text: 'ยกเลิก',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            CupertinoDialogAction(
              onPressed: onPressed,
              child: CustomText(
                text: 'ตกลง',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeConfig.primary,
              ),
            ),
          ],

        );
      },
    );
  }
  static void showLoadingDialog({
    required BuildContext context,
    required String description,
    required Widget icon,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              CustomText(
                text: description,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              const SizedBox(height: 20),
            ],
          ),


        );
      },
    );
  }
}
