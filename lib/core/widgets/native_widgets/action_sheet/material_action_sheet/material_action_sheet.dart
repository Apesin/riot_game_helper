import 'package:flutter/material.dart';
import '../../../../../main.dart';
import '../../../colors/colors.dart';
import '../../../font/font.dart';
import '../action_sheet_model.dart';

class CustomMaterialActionSheet {
  customMaterialActionSheet(List<ActionSheetModel> actionSheetItems) {
    return showModalBottomSheet(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: _loopItemsLengthWidget(actionSheetItems),
        );
      },
    );
  }

  List<Widget> _loopItemsLengthWidget(List<ActionSheetModel> actionSheetItems) {
    List<Widget> itemWidgetList = [];
    for (var element in actionSheetItems) {
      itemWidgetList.add(_materialSelectedItemWidget(element));
    }
    return itemWidgetList;
  }

  _materialSelectedItemWidget(ActionSheetModel actionSheetModel) {
    return ListTile(
      leading: Icon(actionSheetModel.optionIcon,color: actionSheetModel.textColor ?? ProjectColor.colorsBlack,),
      title: Text(actionSheetModel.optionTitle,style: TextStyleBase.normalFont13(actionSheetModel.textColor ?? ProjectColor.colorsBlack),),
      onTap: () async {
        return await actionSheetModel.optionFunction();
      },
    );
  }
}
