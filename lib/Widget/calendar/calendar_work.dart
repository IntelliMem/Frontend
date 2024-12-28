import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/util.dart';
import 'package:intl/intl.dart';

class CalendarWork extends StatelessWidget {
  final TodoItem item;
  CalendarWork({super.key, required this.item});
  final double _containerWidth2 = Util.getWidgetSize(7 / 9);

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm').format(item.timestamp);
    return Container(
      width: _containerWidth2,
      padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formattedTime,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text(
              item.work,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff267F5C),
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
