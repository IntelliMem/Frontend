import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/controller/date_controller.dart';
import 'package:intl/intl.dart';

class DialogHelper {
  static void showTodoDialog(
    BuildContext context, {
    required DateTime date,
    required List<TodoItem> list,
    required double containerWidth2,
  }) {
    final dayOfWeek = DateUtil.getDayOfWeek(date.weekday);
    final monthName = DateUtil.getMonthName(date.month);
    final day = date.day;

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xffE7F3EE),
          title: Row(
            children: [
              Text(
                dayOfWeek,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 30),
              Text(
                '$monthName $day',
                style: TextStyle(fontSize: 10.sp),
              ),
            ],
          ),
          content: Container(
            width: 300,
            height: 500,
            child: Column(
              children: [
                Container(
                  width: containerWidth2,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  height: 1,
                  color: const Color(0xffA7A7A7),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      String timeFormatted = list[index].time != null
                          ? DateFormat('HH:mm').format(list[index].time!)
                          : "";
                      return ListTile(
                        title: Text(
                          list[index].task,
                          style: TextStyle(
                              color: Color(0xff267F5C),
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(timeFormatted),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
