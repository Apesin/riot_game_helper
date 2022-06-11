import 'dart:io';

import '/core/widgets/native_widgets/switches/cupertino_switch/cupertino_switch.dart';
import '/core/widgets/native_widgets/switches/material_switch/material_switch.dart';

class AdaptiveSwitch {
  final CustomMaterialSwitch _customMaterialSwitch = CustomMaterialSwitch();
  final CustomCupertinoSwitch _cupertinoSwitch = CustomCupertinoSwitch();

  adaptiveSwitch({required bool value, required Function(bool) onChanged}) {
    return Platform.isAndroid
        ? _customMaterialSwitch
            .materialSwitch(value: value, onChanged: onChanged)
        : _cupertinoSwitch
            .cupertinoSwitch(value: value, onChanged: onChanged);
  }
}
