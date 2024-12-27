import 'package:flutter_screenutil/flutter_screenutil.dart';

class Util {
  static double getWidgetSize(double number) {
    return ScreenUtil().screenWidth < ScreenUtil().screenHeight
        ? ScreenUtil().screenWidth * (number)
        : ScreenUtil().screenHeight * (number);
  }
}