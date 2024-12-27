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
    return Column(
      children: [
        if (_category != "Me") GreenHeader(title: _category),
        if (_category == "Me") MeHeader(),
        Expanded(
          child: Container(
            color: const Color(0xffF8F8F8),
            child: ListView.builder(
              padding: EdgeInsets.all(15.w),
              itemCount: 5,
              itemBuilder: (context, index) {
                bool isEven = index % 2 == 0;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        if (index == 0) SizedBox(height: 30.h),
                        if (index != 0)
                          Column(
                            children: List.generate(3, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 4.h),
                                width: 2.w,
                                height: 4.h,
                                color: Colors.grey.withOpacity(0.5),
                              );
                            }),
                          ),
                        CircleAvatar(
                          radius: 8.r,
                          backgroundColor: isEven
                              ? const Color(0xffFFD375)
                              : const Color(0xff77C6A7),
                        ),
                        if (index != 4)
                          Column(
                            children: List.generate(3, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 4.h),
                                width: 2.w,
                                height: 4.h,
                                color: Colors.grey.withOpacity(0.5),
                              );
                            }),
                          ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w),
                        child: MemoWidget(
                          title: isEven ? "Happy Day" : "Wow",
                          date: isEven ? "2024.12.12" : "2024.12.13",
                          image: isEven ? 'assets/TestImage.png' : null,
                          color: isEven
                              ? const Color(0xffFFD375)
                              : const Color(0xff77C6A7),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
