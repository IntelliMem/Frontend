import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/green_header.dart';
import 'package:imagine_cup/Widget/memo_widget.dart';
import '../Widget/photo_widget.dart';

class MemoScreen extends StatelessWidget {
  final bool _hasPhoto;

  const MemoScreen({super.key, required bool hasPhoto}) : _hasPhoto = hasPhoto;

  final String title = "Title";
  final String memo = "Today is a great day to start something new, "
      "so set even a small goal for yourself. "
      "Taking a moment to relax with a warm cup of tea is just as important. "
      "Remember, everything you do could be a source of inspiration for someone else, "
      "so believe in yourself!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff469D7B),
        elevation: 0,
      ),
      backgroundColor: const Color(0xffF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GreenHeader(title: title),
            Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    if (_hasPhoto == true) PhotoWidget(),
                    MemoWidget(memo: memo),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
