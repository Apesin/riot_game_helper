import 'package:flutter/cupertino.dart';
import '../../../../constants/base_item_colors.dart';

class CustomCupertinoSwitch extends BaseItemColors{
  cupertinoSwitch({required bool value,required Function(bool) onChanged}) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: switchActiveColor,
      
    );
  }
}
