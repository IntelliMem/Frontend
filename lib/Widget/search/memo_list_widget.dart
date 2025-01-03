import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Screen/memo_screen.dart';
import '../../util.dart';

class MemoListWidget extends StatelessWidget {
  final String _title;
  final String _date;
  final String? _image;
  final Color _color;

  final double _imageWidth = Util.getWidgetSize(1 / 8);
  final double _containerWidth = Util.getWidgetSize(2 / 3);

  MemoListWidget({
    super.key,
    required String title,
    required String date,
    String? image,
    required Color color,
  })  : _color = color,
        _image = image,
        _date = date,
        _title = title;

  bool setHasPhoto() {
    if (_image != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemoScreen(
                hasPhoto: setHasPhoto(),
              ),
            ),
          );
        },
        child: IntrinsicHeight(
          child: Container(
            margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
            width: _containerWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 2.w,
                  blurRadius: 3.h,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // 모든 자식 높이를 동일하게 설정
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // 왼쪽 Container 높이 동기화
                  children: [
                    Container(
                      width: 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                        color: _color,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _title,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _date,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (_image != null)
                  Container(
                    padding: EdgeInsets.only(top: 3.h, bottom: 3.h, right: 5.w),
                    height: _imageWidth,
                    width: _imageWidth,
                    child: Image.asset(
                      _image,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
