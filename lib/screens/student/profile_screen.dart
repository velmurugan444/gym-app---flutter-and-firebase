import 'package:flutter/material.dart';
import 'package:gym_app/models/loginauthentication.dart';
import 'package:gym_app/models/model.dart';
import 'package:gym_app/screens/student/profileimagepreview_screen.dart';
import 'package:gym_app/screens/student/resultupload_screen.dart';
import 'package:gym_app/screens/student/workoutstatus_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Model> list = List();
  void _image() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new ProfileImagePreview()));
  }

  Widget textField({String hintText}) {
    return Material(
      elevation: 1,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing: 2,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
          fillColor: Colors.white30,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.jpg'),
                        fit: BoxFit.cover)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _image();
                          },
                          child: Consumer<Loginauthentication>(
                              builder: (context, data, child) {
                            return CircleAvatar(
                              radius: 80.0,
                              backgroundImage: data.profileurl != null
                                  ? NetworkImage(data.profileurl)
                                  : data.profileurl,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 570,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Consumer<Loginauthentication>(
                            builder: (context, data, child) {
                          return TextFormField(
                            initialValue: data.username,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'invalid username';
                              }
                              return null;
                            },
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'Enter Username',
                              hintStyle: TextStyle(
                                letterSpacing: 2,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Colors.transparent,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Consumer<Loginauthentication>(
                            builder: (context, data, child) {
                          return TextFormField(
                            initialValue: data.rollno,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'invalid rollno';
                              }
                              return null;
                            },
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'Enter rollno',
                              hintStyle: TextStyle(
                                letterSpacing: 2,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Colors.transparent,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Consumer<Loginauthentication>(
                            builder: (context, data, child) {
                          return TextFormField(
                            initialValue: data.mail,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'invalid mail';
                              }
                              return null;
                            },
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'Enter mail',
                              hintStyle: TextStyle(
                                letterSpacing: 2,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Colors.white30,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Consumer<Loginauthentication>(
                            builder: (context, data, child) {
                          return TextFormField(
                            initialValue: data.dob,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'invalid dob';
                              }
                              return null;
                            },
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'Enter dob',
                              hintStyle: TextStyle(
                                letterSpacing: 2,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Colors.white30,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Consumer<Loginauthentication>(
                            builder: (context, data, child) {
                          return TextFormField(
                            initialValue: data.address,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'invalid address';
                              }
                              return null;
                            },
                            enabled: false,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: 'Enter address',
                              hintStyle: TextStyle(
                                letterSpacing: 2,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Colors.white30,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Consumer<Loginauthentication>(
                            builder: (context, data, child) {
                          return TextFormField(
                            initialValue: data.mobile,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'invalid mobile';
                              }
                              return null;
                            },
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'Enter mobile',
                              hintStyle: TextStyle(
                                letterSpacing: 2,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Colors.white30,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Consumer<Loginauthentication>(
                                builder: (context, data, child) {
                              return RaisedButton(
                                elevation: 1.0,
                                child: Text("Track Records"),
                                textColor: Colors.white,
                                color: Colors.red,
                                onPressed: () {
                                  String rollno = data.rollno;
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new WorkoutStatusScreen(
                                                rollno: rollno,
                                              )));
                                },
                              );
                            }),
                            IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new ResultUploadScreen()));
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
