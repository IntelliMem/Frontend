import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Screen/todo_screen.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/util.dart';
import 'package:intl/intl.dart';

class AddTodoList extends StatelessWidget {
  final NewItem item;
  final Function(NewItem) onDelete;
  final Function(NewItem) onAdd;
  AddTodoList(
      {super.key,
      required this.item,
      required this.onDelete,
      required this.onAdd});

  final double _containerWidth = Util.getWidgetSize(8 / 9);

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        item.time != null ? DateFormat('HH:mm').format(item.time!) : "";

    return Container(
      width: _containerWidth,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
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
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            color: Color(0xffFFF0D8),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.task,
                      style: TextStyle(
                        color: Color(0xff008652),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      formattedTime,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      onAdd(item);
                      onDelete(item);
                    },
                    child: Icon(
                      Icons.arrow_downward,
                      color: Color(0xff008652),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      onDelete(item);
                    },
                    child: Icon(
                      Icons.close,
                      color: Color(0xffD10000),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
