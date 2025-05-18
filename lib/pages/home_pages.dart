import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit_tile.dart';
import 'package:habit_tracker/components/my_fab.dart';
import 'package:habit_tracker/components/my_alert_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // in order to handle each list indivisually we gotta use a list view!

  List listofHabits = [
    ['Study', false],
    ['Gym', false],
    ['Prayer', false],
    ['Music', false],
    ['Family time', false],
  ];

  // let's create a new method variable

  //bool? isCompleted = false;

  // let's create a

  void onTapchange(bool value, int index) {
    setState(() {
      listofHabits[index][1] = value;
    });
  }

  final _newHabitNameController = TextEditingController();

  // create a new habit

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          onCancel: cancelNewHabit,
          onSave: saveNewHabit,
        );
      },
    );
  }

  //save habit method

  void saveNewHabit() {
    //add the dialog to the list
    setState(() {
      listofHabits.add([_newHabitNameController.text, false]);
    });

    //clear new habit while cancelling
    _newHabitNameController.clear();
    //pop out the the dialog
    Navigator.of(context).pop();
  }

  //cancel habit method

  void cancelNewHabit() {
    //clear new habit while cancelling
    _newHabitNameController.clear();
    //pop out the the dialog
    Navigator.of(context).pop();
  }




  //setting 
  void settingHabit(int index){

    showDialog(context: context, builder:  (context) {
      return MyAlertBox(controller: _newHabitNameController, onCancel: () => cancelNewHabit(), onSave: () => saveSettingHabit(index),);
    },);
    
 
  }



  //save index habit implemented

  void saveSettingHabit(int index){
    setState(() {
      listofHabits[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }



  //delete

  void deleteTheHabit(int index){


setState(() {
  listofHabits.removeAt(index);
  
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: () => createNewHabit(),
      ),

      body: ListView.builder(
        itemCount: listofHabits.length,

        itemBuilder: (context, index) {
          return HabitTile(
            habitCompleted: listofHabits[index][1],
            habitName: listofHabits[index][0],
            onChanged: (Value) => onTapchange(Value!, index),
            settingTapped: (p0) => settingHabit(index),
            deleteTapped: (p0) => deleteTheHabit(index),
          );
        },
      ),
    );
  }
}
