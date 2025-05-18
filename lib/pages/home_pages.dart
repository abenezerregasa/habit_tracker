import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit_tile.dart';

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

 bool? isCompleted = false;

// let's create a 


void onTapchange(bool value, int index){
  setState(() {
    listofHabits[index][1] = value;
  });
}












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: ListView.builder(


      itemCount: listofHabits.length,
      
      
      itemBuilder: (context, index) {

      
        

       return HabitTile(
          habitCompleted: listofHabits[index][1], 
          habitName: listofHabits[index][0], 
          onChanged: (Value) => onTapchange(Value!, index),
          );
      
      }, )

    );
  }
}