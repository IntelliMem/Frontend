import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/calendar/calendar_work.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/controller/date_controller.dart';
import 'package:imagine_cup/util.dart';

class CalendarList extends StatefulWidget {
  final DateTime timeStamp;
  final List<TodoItem> list;
  final Function(DateTime) onDateClick;

  CalendarList(
      {super.key,
      required this.timeStamp,
      required this.list,
      required this.onDateClick});

  final double _containerWidth = Util.getWidgetSize(8 / 9);
  final double _containerWidth2 = Util.getWidgetSize(7 / 9);

  @override
  State<CalendarList> createState() => _CalendarListState();
}

class _CalendarListState extends State<CalendarList> {
  @override
  Widget build(BuildContext context) {
    final dayOfWeek = DateUtil.getDayOfWeek(widget.timeStamp.weekday);
    final monthName = DateUtil.getMonthName(widget.timeStamp.month);
    final day = widget.timeStamp.day;
    double containerHeight = ScreenUtil().setHeight(200);

    return GestureDetector(
      onTap: () {
        widget.onDateClick(widget.timeStamp);
      },
      child: Container(
        width: widget._containerWidth,
        height: containerHeight,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffE7F3EE),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    dayOfWeek,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    '$monthName $day',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ],
              ),
            ),
            Container(
              width: widget._containerWidth2,
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              height: 1,
              color: const Color(0xffA7A7A7),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return CalendarWork(item: widget.list[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
