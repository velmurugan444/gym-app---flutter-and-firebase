import 'package:flutter/material.dart';
import 'package:gym_app/screens/auth/login_screen.dart';
import 'package:gym_app/screens/trainer/Trainerworkoutcategory_screen.dart';
import 'package:gym_app/screens/trainer/dataupload_screen.dart';
import 'package:gym_app/screens/trainer/feestatus_screen.dart';
import 'package:gym_app/screens/trainer/fetchresult_screen.dart';
import 'package:gym_app/screens/trainer/trainerimages_screen.dart';
import 'package:gym_app/screens/trainer/trainerviedo_screen.dart';
import 'package:gym_app/screens/trainer/update_attendance.dart';
import 'package:gym_app/screens/trainer/workoutupload_screen.dart';
import 'package:gym_app/screens/trainer/trainerprofile_screen.dart';

class TrainerHomeScreen extends StatefulWidget {
  @override
  _TrainerHomeScreenState createState() => _TrainerHomeScreenState();
}

class _TrainerHomeScreenState extends State<TrainerHomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: TrainerImageScreen()),
    Center(child: TrainerViedoScreen()),
    Center(
      child: TrainerWorkoutCategoryScreen(),
    ),
    Center(child: TrainerProfileScreen()),
  ];

  void _showLogoutMessage(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('From Mr.Fitness Gym'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new LoginScreen()));
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mr.Fitness"),
        actions: [
          IconButton(
              icon: Icon(Icons.upload_file),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => FileUploadScreen()));
              }),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),

            // ignore: deprecated_member_use
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),

            // ignore: deprecated_member_use
            title: Text('Viedo'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            // ignore: deprecated_member_use
            title: Text(' Workout'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),

            // ignore: deprecated_member_use
            title: Text('Profile'),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
                onTap: () {},
                child: Image(
                  image: AssetImage(
                    "assets/gymlogo.jpg",
                  ),
                  width: MediaQuery.of(context).size.width,
                )),
            SizedBox(
              height: 16,
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("Attendance"),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new UpdateAttendanceScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_work),
              title: Text("workout"),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new WorkoutUploadScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text("Fee status"),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new FeeStatusScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text("Result"),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new FetchResultScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                String logoutMessage = "Are you sure you want to logout?";
                _showLogoutMessage(logoutMessage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
