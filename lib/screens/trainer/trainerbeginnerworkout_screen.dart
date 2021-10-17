import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/screens/trainer/beginnerfoodscheduleupdation.dart';
import 'package:gym_app/screens/trainer/beginnerworkoutscheduleupdation.dart';

class TrainerBeginnerWorkoutScreen extends StatefulWidget {
  @override
  _TrainerBeginnerWorkoutScreenState createState() =>
      _TrainerBeginnerWorkoutScreenState();
}

class _TrainerBeginnerWorkoutScreenState
    extends State<TrainerBeginnerWorkoutScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: BeginnerWorkoutScheduleUpdationScreen()),
    Center(
      child: BeginnerFoodScheduleUpdationScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beginner schedule',
          style: GoogleFonts.lato(),
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),

            // ignore: deprecated_member_use
            title: Text('Schedule'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            // ignore: deprecated_member_use
            title: Text('Diet'),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (
          index,
        ) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
