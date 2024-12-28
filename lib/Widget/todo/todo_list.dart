import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/Widget/todo/todo_list_count.dart';
import 'package:imagine_cup/Widget/todo/todo_list_widget.dart';
import 'package:imagine_cup/util.dart';

class TodoList extends StatefulWidget {
  String userId;
  List<TodoItem> list;

  TodoList({super.key, required this.userId, required this.list});

  final double _containerWidth = Util.getWidgetSize(8 / 9);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void deleteItem(TodoItem item) {
    setState(() {
      widget.list.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget._containerWidth,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TodoListCount(count: widget.list.length),
          ...widget.list.asMap().entries.map((entry) {
            int index = entry.key;
            TodoItem todoItem = entry.value;
            int version = index % 2;
            return TodoListWidget(
              work: todoItem.work,
              version: version,
              timestamp: todoItem.timestamp,
              onDelete: () => deleteItem(todoItem),
            );
          }).toList(),
        ],
      ),
    );
  }
}
