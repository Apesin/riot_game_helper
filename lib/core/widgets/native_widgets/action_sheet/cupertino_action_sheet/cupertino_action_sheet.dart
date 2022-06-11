import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../main.dart';
import '../../../../constants/base_item_colors.dart';
import '../../../font/font.dart';
import '../action_sheet_model.dart';

class CustomCupertinoActionSheet extends BaseItemColors {
  customCupertinoActionSheet(List<ActionSheetModel> actionSheetItems) {
    return showCupertinoModalPopup<void>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            child:  Text('iptal'.tr,style: TextStyleBase.boldFont14(CupertinoColors.destructiveRed),),
            onPressed: () {
              Navigator.pop(context);
            },
            isDefaultAction: true,
          ),
          actions: _loopItemsLengthWidget(actionSheetItems)
        ),
      ),
    );
  }

  List<Widget> _loopItemsLengthWidget(List<ActionSheetModel> actionSheetItems){
    List<Widget> itemWidgetList = [];
    for (var element in actionSheetItems) {
      itemWidgetList.add(_cupertinoSelectedItemWidget(element));
    }
    return itemWidgetList;
  }

  _cupertinoSelectedItemWidget(ActionSheetModel actionSheetModel) {
    return Container(
      color: actionSheetModel.backgroundColor,
      child: CupertinoActionSheetAction(
        child:  Text(actionSheetModel.optionTitle,style: TextStyleBase.normalFont13(actionSheetModel.textColor ?? CupertinoColors.activeBlue),),
        onPressed: () async{
         return await actionSheetModel.optionFunction();
        },
      ),
    );
  }
}
