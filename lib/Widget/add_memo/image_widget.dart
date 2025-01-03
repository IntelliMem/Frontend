import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/util.dart';

class ImageWidget extends StatefulWidget {
  ImageWidget({super.key});

  final double _containerWidth = Util.getWidgetSize(1 / 9);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget._containerWidth,
      width: widget._containerWidth,
      decoration: BoxDecoration(
        color: const Color(0xff469D7B),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Icon(
            Icons.image,
            color: Colors.white,
          )),
    );
  }
}
