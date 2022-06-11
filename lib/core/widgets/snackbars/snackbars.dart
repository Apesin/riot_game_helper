import 'package:flutter/material.dart';
import '../colors/colors.dart';
import 'flutter_snackbar.dart';
import 'get_x_snacbar.dart';

class CustomSnackBar {
  static snackbarGetX({
    required String title,
    required String content,
    Color backgroundColor = ProjectColor.red,
    Color textAndIconColor = ProjectColor.colorsWhite,
    Function? onTap,
    required IconData icon,
    int seconds = 3,
  }) {
    return getXSnackBar(
        title: title,
        content: content,
        icon: icon,
        backgroundColor: backgroundColor,
        onTap: onTap,
        seconds: seconds,
        textAndIconColor: textAndIconColor);
  }

  static snackbarFlutter(
      {required String content,
      required Color backgroundColor,
      required Color textColor,
      required Function onTap,
      required IconData icon,
      required int durationSeconds}) {
    return flutterSnackBar(
        content: content,
        backgroundColor: backgroundColor,
        textColor: textColor,
        onTap: onTap,
        icon: icon,
        durationSeconds: durationSeconds);
  }
}
