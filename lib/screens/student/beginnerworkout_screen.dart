import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/screens/student/beginnerfoodschedule_screen.dart';
import 'package:gym_app/screens/student/beginnerworkoutschedule_screen.dart';

class BeginnerWorkoutScreen extends StatefulWidget {
  @override
  _BeginnerWorkoutScreenState createState() => _BeginnerWorkoutScreenState();
}

class _BeginnerWorkoutScreenState extends State<BeginnerWorkoutScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: BeginnerWorkoutScheduleScreen()),
    Center(
      child: BeginnerFoodScheduleScreen(),
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
            title: Text('Workout'),
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
