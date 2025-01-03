import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mic_widget.dart';

class SearchBarWithVoiceWidget extends StatelessWidget {
  final VoidCallback _onPressed;

  const SearchBarWithVoiceWidget(
      {super.key, required void Function() onPressed})
      : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          MicWidget(onMicTap: _onPressed, isListening: true),
        ],
      ),
    );
  }
}
