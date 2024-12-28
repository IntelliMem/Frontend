import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/util.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  CalendarWidget({super.key, required this.onDateSelected});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();

  final double _containerWidth = Util.getWidgetSize(8 / 9);
  final double _containerHeight = Util.getWidgetSize(25 / 31); // 세로 크기를 줄임
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget._containerWidth,
      height: widget._containerHeight,
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.w,
            blurRadius: 1.h,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TableCalendar(
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        firstDay: DateTime(2020, 1, 1),
        lastDay: DateTime(2030, 12, 31),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          widget.onDateSelected(selectedDay);
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronVisible: true,
          rightChevronVisible: true,
          leftChevronIcon: Icon(Icons.chevron_left, size: 24.w),
          rightChevronIcon: Icon(Icons.chevron_right, size: 24.w),
          titleTextStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: Color(0xffFFC96F).withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
          todayDecoration: BoxDecoration(
            color: Color(0xff15B476).withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
          weekendTextStyle: TextStyle(
            color: Colors.red,
            fontSize: 12.sp,
          ),
          defaultTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          weekendStyle: TextStyle(
            color: Colors.red,
            fontSize: 12.sp,
          ),
        ),
        rowHeight: 30.h,
      ),
    );
  }
}
