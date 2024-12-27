import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util.dart';

class MicWidget extends StatelessWidget {
   MicWidget({super.key});
   final double _containerWidth = Util.getWidgetSize(1 / 9);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _containerWidth,
      width: _containerWidth,
      decoration: BoxDecoration(
        color: const Color(0xffFFC96F),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Image.asset(
          'assets/MicIcon.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
