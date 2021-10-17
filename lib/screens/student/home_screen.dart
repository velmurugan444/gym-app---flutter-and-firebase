import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/models/loginauthentication.dart';
import 'package:gym_app/screens/auth/login_screen.dart';
import 'package:gym_app/screens/student/contact_screen.dart';
import 'package:gym_app/screens/student/fees_screen.dart';
import 'package:gym_app/screens/student/images_screen.dart';
import 'package:gym_app/screens/student/info_screen.dart';
import 'package:gym_app/screens/student/profile_screen.dart';
import 'package:gym_app/screens/student/specialworkout_screen.dart';
import 'package:gym_app/screens/student/viedo_screen.dart';
import 'package:gym_app/screens/student/workoutcategory_screen.dart';
import 'package:provider/provider.dart';

import 'currentdayattendance.dart';

class HomeScreen extends StatefulWidget {
  final String image;
  final String username;
  final String rollno;
  final String mailid;
  final String dob;
  final String address;
  final String mobile;

  HomeScreen({
    this.image,
    this.username,
    this.rollno,
    this.mailid,
    this.dob,
    this.address,
    this.mobile,
  });
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: ImageScreen()),
    Center(
      child: ViedoScreen(),
    ),
    Center(
      child: WorkoutCategoryScreen(),
    ),
    Center(child: ProfileScreen())
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
        title: Text(
          'MR.FITNESS',
          style: GoogleFonts.lato(),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => InfoScreen()));
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
            title: Text("Viedo"),
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
            Consumer<Loginauthentication>(builder: (context, data, child) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text("Attendance"),
                    onTap: () {
                      String rollno = data.rollno;
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  new CurrentDateAttendanceScreen(
                                      rollno: rollno)));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.home_work),
                    title: Text("Workout"),
                    onTap: () {
                      String rollno = data.rollno;
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  new SpecialWorkoutScreen(rollno: rollno)));
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text("Fee status"),
                    onTap: () {
                      String rollno = data.rollno;
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  new FeesScreen(rollno: rollno)));
                    },
                  )
                ],
              );
            }),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text("Contact"),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => ContactScreen()));
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
