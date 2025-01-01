import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/controller/calendar_controller.dart';
import 'package:imagine_cup/util.dart';
import 'package:intl/intl.dart';

class TodoListWidget extends StatefulWidget {
  final TodoItem item;
  final int version;
  final VoidCallback onDelete;

  const TodoListWidget({
    super.key,
    required this.item,
    required this.version,
    required this.onDelete,
  });

  @override
  State<TodoListWidget> createState() => TodoListWidgetState();
}

class TodoListWidgetState extends State<TodoListWidget> {
  late Color circleColor;
  late Color containerColor;
  late Color textColor;

  @override
  void initState() {
    super.initState();
    _initializeColors();
  }

  void _initializeColors() {
    circleColor = (widget.version == 1)
        ? const Color(0xff469D7B)
        : const Color(0xffFFC96F);
    containerColor = (widget.version == 1)
        ? const Color(0xffD8F6EB)
        : const Color(0xffFFF0D8);
    textColor = (widget.version == 1)
        ? const Color(0xff008652)
        : const Color(0xffBA7F00);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 5, 0, 5),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          TodoCircle(
            color: circleColor,
          ),
          WorkComponent(
            todoId: widget.item.id,
            containerColor: containerColor,
            textColor: textColor,
            onDelete: widget.onDelete,
          ),
        ],
      ),
    );
  }
}

class WorkComponent extends StatefulWidget {
  final int todoId;
  final Color containerColor;
  final Color textColor;
  final VoidCallback onDelete;

  const WorkComponent({
    super.key,
    required this.todoId,
    required this.containerColor,
    required this.textColor,
    required this.onDelete,
  });

  @override
  _WorkComponentState createState() => _WorkComponentState();
}

class _WorkComponentState extends State<WorkComponent> {
  final CalendarController _calendarController = CalendarController();

  late TodoItem item;
  bool isIconClicked = false;
  bool isPressed = false;

  Future<TodoItem> fetchTodoItem() async {
    return await _calendarController.fetchTodoById(widget.todoId);
  }

  Future<void> updateTodoStatus() async {
    bool success = await _calendarController.updateTodoStatus(
        widget.todoId, !isIconClicked);

    if (success) {
      setState(() {
        isIconClicked = !isIconClicked;
        item.completed = isIconClicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TodoItem>(
      future: fetchTodoItem(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return Center(child: Text('No data available'));
        }

        item = snapshot.data!;
        isIconClicked = item.completed;

        String formattedTime =
            item.time != null ? DateFormat('HH:mm').format(item.time!) : "";

        return GestureDetector(
          onLongPress: () {
            setState(() {
              isPressed = true;
            });
          },
          onLongPressEnd: (_) {
            setState(() {
              isPressed = false;
            });
            widget.onDelete();
          },
          child: Container(
            width: Util.getWidgetSize(6 / 9),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(20, 5, 0, 5),
            decoration: BoxDecoration(
              color: widget.containerColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: isPressed
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ]
                  : [],
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
                          color: widget.textColor,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formattedTime,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    updateTodoStatus();
                  },
                  child: Icon(
                    isIconClicked
                        ? Icons.check_box
                        : Icons.crop_square_outlined,
                    color: widget.textColor,
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

class TodoCircle extends StatelessWidget {
  final Color color;
  TodoCircle({super.key, required this.color});
  final double _containerWidth = Util.getWidgetSize(1 / 25);
  final double _height = Util.getWidgetSize((1 / 10));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: _containerWidth,
            height: _containerWidth,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 2,
            height: _height,
            color: const Color(0xffDDDDDD),
          ),
        ],
      ),
    );
  }
}
