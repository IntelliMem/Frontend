import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileDialog extends StatefulWidget {
  final String _initialName;
  final String _initialBirth;
  final String _initialPhoneNumber;
  final void Function(String name, String birth, String phoneNumber) onSave;

  const EditProfileDialog({
    super.key,
    required String initialName,
    required String initialBirth,
    required String initialPhoneNumber,
    required this.onSave,
  }) : _initialPhoneNumber = initialPhoneNumber, _initialBirth = initialBirth, _initialName = initialName;

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget._initialName);
    phoneController = TextEditingController(text: widget._initialPhoneNumber);
    selectedDate = DateTime.tryParse(widget._initialBirth) ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.w500)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Name"),
          ),
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const Icon(Icons.calendar_today, color: Colors.grey),
                ],
              ),
            ),
          ),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: "Phone Number"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            widget.onSave(
              nameController.text,
              "${selectedDate.toLocal()}".split(' ')[0],
              phoneController.text,
            );
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
