import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextMemoWidget extends StatelessWidget {
  final String _memo;

  const TextMemoWidget({super.key, required String memo}) : _memo = memo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF8F8F8),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 260.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2.w,
                blurRadius: 3.h,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
          child: Center(
            child: Text(
              _memo,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff505050),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
