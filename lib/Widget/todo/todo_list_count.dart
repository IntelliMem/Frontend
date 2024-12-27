import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/util.dart';

class TodoListCount extends StatelessWidget {
  final int count;
  TodoListCount({super.key, required this.count});

  final double _containerWidth = Util.getWidgetSize(1 / 7);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _containerWidth,
      height: _containerWidth,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff469D7B),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'total',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
