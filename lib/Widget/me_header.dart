import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util.dart';

class MeHeader extends StatelessWidget {
  MeHeader({super.key});

  final double _radiusSize = Util.getWidgetSize(1 / 4);

  // 사용자 정보 받아서 사용
  final String _name = "Me";
  final String _birth = "2000.01.01";
  final String _phoneNumber = "010-1234-5678";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xff469D7B),
          height: 26.h,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 5.w, bottom: 3.h),
                child: Image.asset("assets/EditIcon.png"),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.h, bottom: 10.h), // 변경: bottom 값 줄임
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            // Stack + Text 모두 포함
            children: [
              Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 300.w,
                      height: 80.h,
                      child: Image.asset(
                        "assets/MeBackGroundImage.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: _radiusSize,
                      height: _radiusSize,
                      child: Transform.translate(
                        offset: Offset(0.w, 50.h),
                        child: ClipOval(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset("assets/ProfileImage.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20.h),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _name,
                            style: TextStyle(
                              fontSize: 27.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  _birth,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Birth",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  _phoneNumber,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Phone Number",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
