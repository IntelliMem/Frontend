import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util.dart';

class MicWidget extends StatelessWidget {
  final VoidCallback _onMicTap;
  final bool _isStartListening;

  const MicWidget({super.key, required void Function() onMicTap, required bool isListening}) : _isStartListening = isListening, _onMicTap = onMicTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onMicTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: Util.getWidgetSize(1 / 9),
        width: Util.getWidgetSize(1 / 9),
        decoration: BoxDecoration(
          color: const Color(0xffFFC96F),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: _isStartListening? EdgeInsets.all(10.w) : EdgeInsets.all(5.w),
          child: Image.asset(
            _isStartListening ? 'assets/StopIcon.png' :'assets/MicIcon.png' ,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
