import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;

  const HabitTile({super.key, required this.habitCompleted, required this.habitName, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(24),
        
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),

        
      
      
      
      
      
        child: Row(
          children: [

            Checkbox(value:habitCompleted, onChanged: onChanged,),

            Text(habitName),
          ],
        ),
      
      
      ),
    );
  }
}