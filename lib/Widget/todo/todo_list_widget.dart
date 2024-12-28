import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imagine_cup/util.dart';
import 'package:intl/intl.dart';

class TodoListWidget extends StatelessWidget {
  final String work;
  final DateTime timestamp;
  final int version;
  const TodoListWidget(
      {super.key,
      required this.work,
      required this.timestamp,
      required this.version});

  @override
  Widget build(BuildContext context) {
    Color circleColor =
        (version == 1) ? const Color(0xff469D7B) : const Color(0xffFFC96F);
    Color containerColor =
        (version == 1) ? const Color(0xffD8F6EB) : const Color(0xffFFF0D8);
    Color textColor =
        (version == 1) ? const Color(0xff008652) : const Color(0xffBA7F00);

    return Container(
      margin: const EdgeInsets.fromLTRB(25, 5, 0, 5),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          TodoCircle(
            color: circleColor,
          ),
          WorkComponent(
            work: work,
            timestamp: timestamp,
            containerColor: containerColor,
            textColor: textColor,
          ),
        ],
      ),
    );
  }
}

class WorkComponent extends StatefulWidget {
  final String work;
  final DateTime timestamp;
  final Color containerColor;
  final Color textColor;

  const WorkComponent({
    super.key,
    required this.work,
    required this.timestamp,
    required this.containerColor,
    required this.textColor,
  });

  @override
  _WorkComponentState createState() => _WorkComponentState();
}

class _WorkComponentState extends State<WorkComponent> {
  bool isIconClicked = false;

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm').format(widget.timestamp);
    return Container(
      width: Util.getWidgetSize(6 / 9),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(20, 5, 0, 5),
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.work,
                  style: TextStyle(
                    color: widget.textColor,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 4),
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
              setState(() {
                isIconClicked = !isIconClicked;
              });
            },
            child: Icon(
              isIconClicked ? Icons.check_box : Icons.crop_square_outlined,
              color: widget.textColor,
            ),
          ),
        ],
      ),
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
    return Container(
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
