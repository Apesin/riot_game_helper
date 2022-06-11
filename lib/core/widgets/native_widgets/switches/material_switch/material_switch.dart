import 'package:flutter/material.dart';
import '../../../../constants/base_item_colors.dart';

class CustomMaterialSwitch extends BaseItemColors{
  materialSwitch({required bool value,required Function(bool) onChanged}) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: switchActiveColor,
      inactiveThumbColor: switchInactiveColor,
    );
  }
}
