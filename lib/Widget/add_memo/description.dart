import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Memo',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Please explain specifically what you want to remember for a long time.',
            style: TextStyle(
              fontSize: 13.sp,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'ex1) My front door password is 1234.',
            style: TextStyle(
              fontSize: 13.sp,
              color: Color(0xff469D7B),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'ex2) There are 4 people in my family and my name is Max.',
            style: TextStyle(
              fontSize: 13.sp,
              color: Color(0xff469D7B),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'If you want to type by voice, please press the microphone button and tell me.',
            style: TextStyle(
              fontSize: 13.sp,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
