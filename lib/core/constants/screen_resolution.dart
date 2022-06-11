import 'package:sizer/sizer.dart';

class ScreenResolution {
  // final double lowHeight = 800;
  // final double mediumHeigth = 1400;
  // final double hightHeight = 2500;

  // static double screenHeight = 100.h;

  // double setItemHeight1(double lowH, double mediumH, double hightH) {
  //   if (screenHeight < lowHeight) {
  //     return lowH;
  //   } else if (screenHeight > lowHeight && screenHeight < mediumHeigth) {
  //     return mediumH;
  //   } else {
  //     return hightH;
  //   }
  // }

  final double lowWidth = 640;
  final double mediumWidth = 768;
  final double largeWidth = 1024;
  final double hightWidth = 1280;

  double screenWidth = 100.w;

  double setItemHeight(double lowH, double mediumH, double hightH) {
    if (screenWidth <= lowWidth) {
      return lowH;
    } else if (screenWidth > lowWidth && screenWidth <= mediumWidth) {
      return mediumH;
    } else if (screenWidth > mediumWidth && screenWidth <=hightWidth){
      return hightH;
    }else{
      return hightH + (hightH*0.2);
    }
  }
}
