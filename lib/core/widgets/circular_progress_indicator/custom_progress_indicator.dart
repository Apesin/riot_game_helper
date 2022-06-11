import 'package:flutter/material.dart';
import '../../constants/base_item_colors.dart';
import '../colors/colors.dart';

class CustomProgresIndicator extends BaseItemColors {
  Widget progressInWidget({Color progressColor = ProjectColor.colorsWhite}) {
    return Center(
      child: CircularProgressIndicator(
        color: progressColor,
      ),
    );
  }

  progressInStack({Color progressColor = ProjectColor.colorsWhite}) {
    return Positioned.fill(
      child: Container(
        color: baseWhiteColor.withOpacity(0.1),
        child: Center(
          child: CircularProgressIndicator(
            color: progressColor,
          ),
        ),
      ),
    );
  }
}
