import '../../../../constants/base_item_colors.dart';
import '/core/widgets/font/font.dart';
import 'package:flutter/material.dart';

class MaterialDialogs extends BaseItemColors{

  materialOkDialog({
    required String title,
    required String content,
    required Function buttonFunction,
    required String okButtonText,
  }) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Text(
        title,
        style: TextStyleBase.boldFont10(baseBlackColor),
      ),
      content: Text(
        content,
         style: TextStyleBase.normalFont10(baseBlackColor),
      ),
      actions: [
        TextButton(
          child: Text(
            okButtonText,
             style: TextStyleBase.normalFont10(baseBlackColor),
          ),
          onPressed: () async {
            buttonFunction();
          },
        ),
      ],
    );
  }



  materialOkCancelDialog({
    required String title,
    required String content,
    required Function okFunction,
    required Function cancelFunction,
    required String okButtonText,
    required String cancelButtonText,
  }) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Text(
        title,
        style: TextStyleBase.boldFont10(baseBlackColor),
      ),
      content: Text(
        content,
        style: TextStyleBase.normalFont10(baseBlackColor),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            TextButton(
              child: Text(
                cancelButtonText,
                style: TextStyleBase.normalFont10(baseBlackColor),
              ),
              onPressed: () async {
                cancelFunction();
              },
            ),
            TextButton(
              child: Text(
                okButtonText,
                style: TextStyleBase.boldFont10(baseBlackColor),
              ),
              onPressed: () async {
                okFunction();
              },
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        )
      ],
    );
  }
}
