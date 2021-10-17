import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/screens/trainer/intermediatefoodscheduleupdation.dart';
import 'package:gym_app/screens/trainer/intermediateworkoutscheduleupdation.dart';

class TrainerIntermediateWorkoutScreen extends StatefulWidget {
  @override
  _TrainerIntermediateWorkoutScreenState createState() =>
      _TrainerIntermediateWorkoutScreenState();
}

class _TrainerIntermediateWorkoutScreenState
    extends State<TrainerIntermediateWorkoutScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: IntermediateWorkoutScheduleUpdationScreen()),
    Center(child: IntermediateFoodScheduleUpdationScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Intermediate schedule',
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
