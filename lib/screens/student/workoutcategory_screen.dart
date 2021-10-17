import 'package:flutter/material.dart';
import 'package:gym_app/screens/student/beginnerworkout_screen.dart';

import 'expertworkout_screen.dart';
import 'intermediateworkout_screen.dart';

class WorkoutCategoryScreen extends StatefulWidget {
  @override
  _WorkoutCategoryScreenState createState() => _WorkoutCategoryScreenState();
}

class _WorkoutCategoryScreenState extends State<WorkoutCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Ink.image(
                        image: AssetImage("assets/beginner.jpg"),
                        child: InkWell(onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new BeginnerWorkoutScreen()));
                        }),
                        height: 240,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      'Beginner',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Ink.image(
                      image: AssetImage("assets/intermediate.jpg"),
                      child: InkWell(onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new IntermediateWorkoutScreen()));
                      }),
                      height: 240,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'Intermediate',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Ink.image(
                      image: AssetImage("assets/expert.jpg"),
                      child: InkWell(onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new ExpertWorkoutScreen()));
                      }),
                      height: 240,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'Advanced',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
