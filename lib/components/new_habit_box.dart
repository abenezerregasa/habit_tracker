import 'package:flutter/material.dart';

class EnterNewHabitBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const EnterNewHabitBox({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,

          color: Colors.black,
          child: Text("Save", style: TextStyle(color: Colors.white)),
        ),
        MaterialButton(
          onPressed: onCancel,

          color: Colors.black,
          child: Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
