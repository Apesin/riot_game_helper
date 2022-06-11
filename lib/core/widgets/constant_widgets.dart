import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConstantsWidget{
  static const BorderRadius borderRadius_5 = BorderRadius.all(Radius.circular(5));
  static const BorderRadius borderRadius_16 = BorderRadius.all(Radius.circular(16));
  static const BorderRadius borderRadius_8 = BorderRadius.all(Radius.circular(8));
  static const EdgeInsets allPadding_16 = EdgeInsets.all(16.0);
  static const EdgeInsets allPadding_8 = EdgeInsets.all(8.0);
  static const EdgeInsets onlyLeftRightPadding_16 = EdgeInsets.only(left:16.0,right: 16);
  static const EdgeInsets onlyLeftRightPadding_8 = EdgeInsets.only(left:8.0,right: 8);

  static const EdgeInsets allPadding_45 = EdgeInsets.all(45.0);
  static Widget defaultHeightSmall = SizedBox(height: 2.h);
  static Widget defaultHeightMedium = SizedBox(height: 4.h);
  static Widget defaultHeightLarge = SizedBox(height: 10.h);



}