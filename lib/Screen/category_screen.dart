import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/green_header.dart';
import 'package:imagine_cup/Widget/me_header.dart';
import 'package:imagine_cup/Widget/memo_list_widget.dart';
import '../Widget/edit_profile_dialog.dart';

class CategoryScreen extends StatefulWidget {
  final String _category;

  const CategoryScreen({super.key, required String category})
      : _category = category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // 사용자 정보 받아서 사용
  String name = "Me";
  String birth = "2000-01-01";
  String phoneNumber = "010-1234-5678";

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

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return EditProfileDialog(
          initialName: name,
          initialBirth: birth,
          initialPhoneNumber: phoneNumber,
          onSave: (newName, newBirth, newPhoneNumber) {
            setState(() {
              name = newName;
              birth = newBirth;
              phoneNumber = newPhoneNumber;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xff469D7B),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          if (widget._category == "Me")
            InkWell(
              onTap: () => _showEditDialog(context),
              child: Container(
                padding: EdgeInsets.only(right: 10.w, top: 5.h),
                child: Image.asset(
                  "assets/EditIcon.png",
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          if (widget._category != "Me")
            GreenHeader(
              title: widget._category,
            ),
          if (widget._category == "Me")
            MeHeader(
              name: name,
              birth: birth,
              phoneNumber: phoneNumber,
            ),
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
