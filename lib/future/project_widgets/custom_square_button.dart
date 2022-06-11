import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/colors/colors.dart';
import '../../core/widgets/constant_widgets.dart';

class CustomSquareButton extends StatelessWidget {
  final IconData? buttonIcon;
  final Function? onTapFunction;
  final Color? backGroundColor;
  final Color? iconColor;
  const CustomSquareButton(
      {Key? key,
      this.buttonIcon,
      this.iconColor,
      this.backGroundColor,
      this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: backGroundColor??ProjectColor.riotBackground.withOpacity(0.5),
        borderRadius: ConstantsWidget.borderRadius_5,
      ),
      child: GestureDetector(
        onTap: () async {
          if (onTapFunction == null) {
            Get.back();
          } else {
            await onTapFunction!();
          }
        },
        child: Icon(
          buttonIcon??Icons.arrow_back_ios_new,
          color: iconColor??ProjectColor.riotWhite,
        ),
      ),
    );
  }
}
