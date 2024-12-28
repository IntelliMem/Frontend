import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mic_widget.dart';

class SearchHeadWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const SearchHeadWidget(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      margin: EdgeInsets.only(bottom: 20.h),
      color: const Color(0xff469D7B),
      child: Column(
        mainAxisSize: MainAxisSize.min, // min 설정을 통해서 overflow 막음
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0.h, left: 20.w, bottom: 20.h),
                child: Text(
                  label,
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
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: 'input text',
                          hintStyle: TextStyle(
                            color: Colors.white.withValues(
                              red: 255,
                              green: 255,
                              blue: 255,
                              alpha: 0.3,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ))),
                      keyboardType: TextInputType.name,
                    )),
                MicWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
