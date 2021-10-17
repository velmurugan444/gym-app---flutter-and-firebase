import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/screens/student/expertfoodschedule_screen.dart';
import 'package:gym_app/screens/student/expertworkoutschedule_screen.dart';

class ExpertWorkoutScreen extends StatefulWidget {
  @override
  _ExpertWorkoutScreenState createState() => _ExpertWorkoutScreenState();
}

class _ExpertWorkoutScreenState extends State<ExpertWorkoutScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: ExpertWorkoutScheduleScreen()),
    Center(
      child: ExpertFoodScheduleScreen(),
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
