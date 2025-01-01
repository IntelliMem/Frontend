import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/Widget/todo/todo_list_count.dart';
import 'package:imagine_cup/Widget/todo/todo_list_widget.dart';
import 'package:imagine_cup/util.dart';

class TodoList extends StatefulWidget {
  String userId;
  List<TodoItem> list;
  final Function(TodoItem) deleteItem;

  TodoList({
    super.key,
    required this.userId,
    required this.list,
    required this.deleteItem,
  });

  final double _containerWidth = Util.getWidgetSize(8 / 9);

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final GlobalKey<TodoListWidgetState> todoListKey =
      GlobalKey<TodoListWidgetState>();

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
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                final todoItem = widget.list[index];
                final version = index % 2;

                return TodoListWidget(
                  key: todoListKey,
                  item: todoItem,
                  version: version,
                  onDelete: () => widget.deleteItem(todoItem),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
