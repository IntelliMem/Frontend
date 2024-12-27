import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mic_widget.dart';

class SearchHeadWidget extends StatelessWidget {
  const SearchHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      margin: EdgeInsets.only(bottom: 20.h),
      color: const Color(0xff469D7B),
      child: Column(
        mainAxisSize: MainAxisSize.min,  // min 설정을 통해서 overflow 막음
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top:0.h,left: 20.w, bottom: 20.h),
                child: Text(
                  'Search',
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30.w),
                  height: 40.h,
                  width: 200.w,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    color: Colors.white,
                  )),
                ),
                MicWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
