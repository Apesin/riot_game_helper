import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../constant_widgets.dart';
import '../font/font.dart';


flutterSnackBar(
    {required String content,
    required Color backgroundColor,
    required Color textColor,
    required Function onTap,
    required IconData icon,
    required int durationSeconds}) {
  return ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
    SnackBar(
      margin:
          EdgeInsets.only(bottom: Get.size.height * .78, left: 16, right: 16),
      elevation: 10,
      duration: Duration(seconds: durationSeconds),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: ConstantsWidget.borderRadius_5,
      ),
      backgroundColor: backgroundColor,
      content: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(navigatorKey.currentState!.context)
              .hideCurrentSnackBar();
          onTap();
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: textColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                content,
                style: TextStyleBase.normalFont10(
                  textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
