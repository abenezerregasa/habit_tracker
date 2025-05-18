import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile({
    super.key,
    required this.habitCompleted,
    required this.habitName,
    required this.onChanged,
    required this.settingTapped,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            //setting slidable action
            SlidableAction(
              onPressed: settingTapped,
              backgroundColor: Colors.grey,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(8),
            ),

            //delete slidable action
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),

            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),

          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),

          child: Row(
            children: [
              Checkbox(value: habitCompleted, onChanged: onChanged),

              Text(habitName),
            ],
          ),
        ),
      ),
    );
  }
}
