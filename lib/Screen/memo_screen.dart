import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widget/photo_widget.dart';

class MemoScreen extends StatefulWidget {
  final bool _hasPhoto;

  const MemoScreen({super.key, required bool hasPhoto}) : _hasPhoto = hasPhoto;

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  String _title = "Title";
  String _memo = "Today is a great day to start something new, "
      "so set even a small goal for yourself. "
      "Taking a moment to relax with a warm cup of tea is just as important. "
      "Remember, everything you do could be a source of inspiration for someone else, "
      "so believe in yourself!";

  bool _isEditing = false;
  final TextEditingController _memoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _memoController.text = _memo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff469D7B),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xffF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              width: 360.w,
              decoration: BoxDecoration(
                color: const Color(0xff469D7B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w),
                    child: Text(
                      _title,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: IconButton(
                      icon: Icon(
                        _isEditing ? Icons.save : Icons.edit,
                        size: 24.w,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_isEditing) {
                            _memo = _memoController.text;
                          }
                          _isEditing = !_isEditing;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                children: [
                  if (widget._hasPhoto) const PhotoWidget(),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    width: 260.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 2.w,
                          blurRadius: 3.h,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    child: TextField(
                      controller: _memoController,
                      enabled: _isEditing,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your memo here...",
                      ),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff505050),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
