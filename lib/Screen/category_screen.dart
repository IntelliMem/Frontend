import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/green_header.dart';
import 'package:imagine_cup/Widget/me_header.dart';
import 'package:imagine_cup/Widget/memo_list_widget.dart';

class CategoryScreen extends StatelessWidget {
  final String _category;

  const CategoryScreen({super.key, required String category})
      : _category = category;

  @override
  Widget build(BuildContext context) {
    final memoWidgets = [
      MemoListWidget(
        title: "Happy Day",
        date: "2024.12.12",
        image: 'assets/TestImage.png',
        color: const Color(0xffFFD375),
      ),
      MemoListWidget(
        title: "Wow",
        date: "2024.12.13",
        image: null,
        color: const Color(0xff77C6A7),
      ),
      MemoListWidget(
        title: "Excited",
        date: "2024.12.14",
        image: null,
        color: const Color(0xffFFD375),
      ),
      MemoListWidget(
        title: "Relaxed",
        date: "2024.12.15",
        image: null,
        color: const Color(0xff77C6A7),
      ),
      MemoListWidget(
        title: "Amazing",
        date: "2024.12.16",
        image: null,
        color: const Color(0xffFFD375),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor:const Color(0xff469D7B),
      ),
      body: Column(
        children: [
          if (_category != "Me") GreenHeader(title: _category),
          if (_category == "Me") MeHeader(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(15.w),
              itemCount: memoWidgets.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        if (index == 0) SizedBox(height: 30.h),
                        if (index != 0)
                          Column(
                            children: List.generate(2, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                width: 2.w,
                                height: 5.h,
                                color: Colors.grey.shade400,
                              );
                            }),
                          ),
                        CircleAvatar(
                          radius: 8.r,
                          backgroundColor: index % 2 == 0
                              ? const Color(0xffFFD375)
                              : const Color(0xff77C6A7),
                        ),
                        if (index != memoWidgets.length - 1)
                          Column(
                            children: List.generate(2, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                width: 2.w,
                                height: 5.h,
                                color: Colors.grey.shade400,
                              );
                            }),
                          ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w),
                        child: memoWidgets[index],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
