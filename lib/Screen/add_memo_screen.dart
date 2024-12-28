import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/add_memo/description.dart';
import 'package:imagine_cup/Widget/add_memo/image_widget.dart';
import 'package:imagine_cup/Widget/add_memo/memo_input.dart';
import 'package:imagine_cup/Widget/mic_widget.dart';
import 'package:imagine_cup/Widget/submit_button.dart';

class AddMemoScreen extends StatefulWidget {
  late String userId;
  AddMemoScreen({super.key, required this.userId});

  @override
  State<AddMemoScreen> createState() => _AddMemoScreenState();
}

class _AddMemoScreenState extends State<AddMemoScreen> {
  late TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Description(),
          MemoInput(controller: controller),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MicWidget(),
                const SizedBox(width: 10),
                ImageWidget(),
              ],
            ),
          ),
          const Spacer(),
          SubmitButton(
            onPressed: () {},
            text: "Confirm",
            color: const Color(0xff469D7B),
          ),
        ],
      ),
    );
  }
}
