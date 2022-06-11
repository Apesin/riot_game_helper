import 'package:flutter/material.dart';
import '../core/widgets/colors/colors.dart';
import '../core/widgets/snackbars/snackbars.dart';

class SuccessAndErrSnackBar {
  static successSnackBar(String content,{String? title}) {
    return CustomSnackBar.snackbarGetX(
      title: title??"İşlem Başarılı",
      content: content,
      icon: Icons.done,
      backgroundColor: ProjectColor.colorsWhite,
      textAndIconColor: ProjectColor.colorsBlack,
    );
  }
  static errSnackBar(String content,{String? title}){
    return CustomSnackBar.snackbarGetX(
        title: title??"İşlem Başarısız",
        content: content,
        icon: Icons.priority_high,
      );
  }
}
