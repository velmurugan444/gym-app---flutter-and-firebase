import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/screens/trainer/expertfoodscheduleupdation.dart';
import 'package:gym_app/screens/trainer/expertworkoutscheduleupdation.dart';

class TrainerExpertWorkoutScreen extends StatefulWidget {
  @override
  _TrainerExpertWorkoutScreenState createState() =>
      _TrainerExpertWorkoutScreenState();
}

class _TrainerExpertWorkoutScreenState
    extends State<TrainerExpertWorkoutScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: ExpertWorkoutScheduleUpdationScreen()),
    Center(
      child: ExpertFoodScheduleUpdationScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expert schedule',
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
