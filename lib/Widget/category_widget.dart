import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screen/category_screen.dart';
import '../util.dart';

class CategoryWidget extends StatelessWidget {
  final Color _color;
  final String _categoryName;
  final String _categoryImage;

  CategoryWidget(
      {super.key,
      required Color color,
      required String categoryName,
      required String categoryImage})
      : _categoryImage = categoryImage,
        _color = color,
        _categoryName = categoryName;

  final double _squareWidth = Util.getWidgetSize(1 / 9);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(category: _categoryName)),
          );
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 10.h, bottom: 12.h),
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 3.h,
            ),
            height: 70.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 2.w,
                  blurRadius: 3.h,
                  offset: const Offset(1, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15.w),
                      width: _squareWidth,
                      height: _squareWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: _color,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.w), // 내부 여백 추가
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(_categoryImage),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      _categoryName,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: Image.asset(
                    'assets/CategoryVectorIcon.png',
                    width: 20.w, // 너비 설정
                    height: 20.h, // 높이 설정
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
