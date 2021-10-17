import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Trainerhome_screen.dart';

class UpdateAttendanceScreen extends StatefulWidget {
  @override
  _UpdateAttendanceScreenState createState() => _UpdateAttendanceScreenState();
}

class _UpdateAttendanceScreenState extends State<UpdateAttendanceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _rollnocontroller = TextEditingController();

  String valueChoose;
  String status;

  List statusList = ["present", "absent"];
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
        title: Text("Attendance Status"),
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
                    borderSide: BorderSide(color: Colors.red),
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
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
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
                hint: Text(
                  'Pick status',
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 26,
                isExpanded: true,
                style: TextStyle(
                  color: Colors.black,
                ),
                value: status,
                onChanged: (value) {
                  setState(() {
                    status = value;
                  });
                },
                items: statusList.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 15,
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
                  "status": status,
                };
                String successfulMessage =
                    "Attendance was successfully updated";
                FirebaseFirestore.instance
                    .collection("attendance")
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
