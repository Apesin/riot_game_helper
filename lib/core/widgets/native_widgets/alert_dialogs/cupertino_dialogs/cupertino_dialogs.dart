import '../../../../constants/base_item_colors.dart';
import '/core/widgets/font/font.dart';
import 'package:flutter/cupertino.dart';

class CupertinoDialogs extends BaseItemColors{

   cupertinoOkDialog({
    required String title,
    required String content,
    required Function okFunction,
    required String okButtonText,
  }) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: TextStyleBase.boldFont10(baseBlackColor),
      ),
      content: Text(
        content,
        style: TextStyleBase.normalFont10(baseBlackColor),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(
            okButtonText,
            style: TextStyleBase.boldFont10(baseBlackColor),
          ),
          onPressed: () async {
            okFunction();
          },
        ),
      ],
    );
  }


  cupertinoOkCancelDialog({
    required String title,
    required String content,
    required Function okFunction,
    required Function cancelFunction,
    required String okButtonText,
    required String cancelButtonText,
  }) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: TextStyleBase.boldFont10(baseBlackColor),
      ),
      content: Text(
        content,
        style: TextStyleBase.normalFont10(baseBlackColor),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(cancelButtonText,
              style: TextStyleBase.normalFont10(baseBlackColor)),
          onPressed: () async {
            cancelFunction();
          },
        ),
        CupertinoDialogAction(
          child:
              Text(okButtonText, style: TextStyleBase.boldFont10(baseBlackColor)),
          onPressed: () async {
            okFunction();
          },
        ),
      ],
    );
  }
}
