import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Trainerhome_screen.dart';

class WorkoutUploadScreen extends StatefulWidget {
  @override
  _WorkoutUploadScreenState createState() => _WorkoutUploadScreenState();
}

class _WorkoutUploadScreenState extends State<WorkoutUploadScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _rollnocontroller = TextEditingController();
  TextEditingController _mondaycontroller = TextEditingController();
  TextEditingController _tuesdaycontroller = TextEditingController();
  TextEditingController _wednesdaycontroller = TextEditingController();
  TextEditingController _thursdaycontroller = TextEditingController();
  TextEditingController _fridaycontroller = TextEditingController();
  TextEditingController _saturdaycontroller = TextEditingController();
  TextEditingController _sundaycontroller = TextEditingController();

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
        title: Text("Upload Workout"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _datecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'invalid date';
                  }
                  return null;
                },
                enabled: true,
                decoration: InputDecoration(
                  hintText: 'Pick Date ',
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
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  var formattedDate = "${date.day}-0${date.month}-${date.year}";
                  _datecontroller.text = formattedDate.toString();
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _namecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter name ',
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
                controller: _rollnocontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter rollno';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter rollno ',
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
                controller: _mondaycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter monday workout';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter monday workout',
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
                controller: _tuesdaycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter tuesday workout';
                  }
                  return null;
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
                controller: _wednesdaycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter wednesday workout';
                  }
                  return null;
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
                controller: _thursdaycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter thursday workout';
                  }
                  return null;
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
                controller: _fridaycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter friday workout';
                  }
                  return null;
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
                controller: _saturdaycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter saturday workout';
                  }
                  return null;
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
                controller: _sundaycontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter sunday workout';
                  }
                  return null;
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
              onPressed: () {
                if (!_formKey.currentState.validate()) {
                  return;
                }
                _formKey.currentState.save();
                Map<String, dynamic> data = {
                  "date": _datecontroller.text,
                  "name": _namecontroller.text,
                  "rollno": _rollnocontroller.text,
                  "monday": _mondaycontroller.text,
                  "tuesday": _tuesdaycontroller.text,
                  "wednesday": _wednesdaycontroller.text,
                  "thursday": _thursdaycontroller.text,
                  "friday": _fridaycontroller.text,
                  "saturday": _saturdaycontroller.text,
                  "sunday": _sundaycontroller.text,
                };
                String successfulMessage = "Workout was successfully updated";
                FirebaseFirestore.instance
                    .collection("workouts")
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
