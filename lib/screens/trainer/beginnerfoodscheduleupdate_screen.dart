import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Trainerhome_screen.dart';

class BeginnerFoodScheduleUploadScreen extends StatefulWidget {
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;
  BeginnerFoodScheduleUploadScreen({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });
  @override
  _BeginnerFoodScheduleUploadScreenState createState() =>
      _BeginnerFoodScheduleUploadScreenState();
}

class _BeginnerFoodScheduleUploadScreenState
    extends State<BeginnerFoodScheduleUploadScreen> {
  String monday, tuesday, wednesday, thursday, friday, saturday, sunday;
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _showSuccessfulMessage(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('From Mr.Fitness gym'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new TrainerHomeScreen()));
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
        title: Text("Update Food Schedule"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.monday,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter monday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  monday = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter monday ',
                  hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.tuesday,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter tuesday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  tuesday = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter tuesday workout ',
                  hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.wednesday,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter wednesday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  wednesday = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter wednesday workout ',
                  hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.thursday,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter thursday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  thursday = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter thursday workout ',
                  hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.friday,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter friday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  friday = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter friday workout ',
                  hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.saturday,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter saturday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  saturday = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter saturday workout ',
                  hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.sunday,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter sunday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  sunday = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter sunday workout ',
                  hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () async {
                if (!_formKey.currentState.validate()) {
                  return;
                }
                _formKey.currentState.save();
                await FirebaseFirestore.instance
                    .collection("beginnerfoodschedule")
                    .get()
                    .then((snapshot) => snapshot.docs.first.reference.delete());
                Map<String, dynamic> data = {
                  "day1": monday,
                  "day2": tuesday,
                  "day3": wednesday,
                  "day4": thursday,
                  "day5": friday,
                  "day6": saturday,
                  "day7": sunday,
                };
                String successfulMessage =
                    "Beginner schedule was successfully updated";
                FirebaseFirestore.instance
                    .collection("beginnerfoodschedule")
                    .add(data)
                    .then((value) => _showSuccessfulMessage(successfulMessage));
              },
              color: Colors.red.shade400,
              child: Text("Update"),
            )
          ]),
        ),
      ),
    );
  }
}
