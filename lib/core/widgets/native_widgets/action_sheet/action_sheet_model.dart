import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class ActionSheetModel  {
  String optionTitle;
  IconData optionIcon;
  Function optionFunction;
  Color backgroundColor;
  Color? textColor;


  ActionSheetModel(
      {required this.optionFunction,
      required this.optionIcon,
      required this.optionTitle,
      this.backgroundColor = ProjectColor.colorsWhite,
      this.textColor
      });
}
