import 'dart:io';
import 'action_sheet_model.dart';
import 'cupertino_action_sheet/cupertino_action_sheet.dart';
import 'material_action_sheet/material_action_sheet.dart';

class AdaptiveActionSheet {
  static adaptiveActionSheet(List<ActionSheetModel> actionSheetItems) {
    return Platform.isIOS
        ? CustomCupertinoActionSheet()
            .customCupertinoActionSheet(actionSheetItems)
        : CustomMaterialActionSheet()
            .customMaterialActionSheet(actionSheetItems);
  }
}
