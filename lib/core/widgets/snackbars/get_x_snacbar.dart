import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant_widgets.dart';

getXSnackBar({
  required String title,
  required String content,
  required Color backgroundColor,
  required Color textAndIconColor,
  Function? onTap,
  required IconData icon,
  required int seconds,
}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    title,
    content,
    icon: Icon(icon, color: textAndIconColor),
    snackPosition: SnackPosition.TOP,
    backgroundColor: backgroundColor,
    borderRadius: 16,
    margin: ConstantsWidget.allPadding_16,
    colorText: textAndIconColor,
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    forwardAnimationCurve: Curves.easeOutBack,
    duration: Duration(seconds: seconds),
    onTap: (snack) => onTap!(),
  );
}
