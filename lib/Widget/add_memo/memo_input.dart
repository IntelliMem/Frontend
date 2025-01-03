import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/util.dart';

class MemoInput extends StatefulWidget {
  final TextEditingController controller;
  MemoInput({super.key, required this.controller});

  final double _containerWidth = Util.getWidgetSize(8 / 9);

  @override
  State<MemoInput> createState() => _MemoInputState();
}

class _MemoInputState extends State<MemoInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget._containerWidth,
        constraints: BoxConstraints(
          minHeight: 150.h,
        ),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: 'please enter your memo',
              hintStyle: TextStyle(
                color: Colors.white.withValues(
                  red: 255,
                  green: 255,
                  blue: 255,
                  alpha: 0.3,
                ),
              ),
              filled: true,
              fillColor: Color(0xffFCFCFC),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: Color(0xffD6D6D6)),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xffD6D6D6),
                  ))),
          keyboardType: TextInputType.name,
          minLines: 5,
          maxLines: 5,
        ));
  }
}
