import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BeginnerFoodScheduleScreen extends StatefulWidget {
  final String image;
  final String username;
  final String rollno;
  final String mailid;
  final String dob;
  final String address;
  final String mobile;
  BeginnerFoodScheduleScreen({
    this.image,
    this.username,
    this.rollno,
    this.mailid,
    this.dob,
    this.address,
    this.mobile,
  });
  @override
  _BeginnerFoodScheduleScreenState createState() =>
      _BeginnerFoodScheduleScreenState();
}

class _BeginnerFoodScheduleScreenState
    extends State<BeginnerFoodScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('beginnerfoodschedule')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot myPost = snapshot.data.documents[index];
                  return Stack(
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70.0),
                          child: DataTable(
                            dataRowColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected))
                                return Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.08);
                              return Colors.red.shade200;
                              //Use the default value.
                            }),
                            columns: [
                              DataColumn(
                                  label: Text('',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text(
                                  'Monday',
                                  style: TextStyle(fontSize: 15.0),
                                )),
                                DataCell(Text(
                                  myPost['day1'],
                                  style: TextStyle(fontSize: 15.0),
                                )),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  'Tuesday',
                                  style: TextStyle(fontSize: 15.0),
                                )),
                                DataCell(Text(
                                  myPost['day2'],
                                  style: TextStyle(fontSize: 15.0),
                                )),
                              ]),
                              DataRow(cells: [
                                DataCell(
                                  Text(
                                    'Wednesday',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                                DataCell(Text(
                                  myPost['day3'],
                                  style: TextStyle(fontSize: 15.0),
                                )),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  'Thrusday',
                                  style: TextStyle(fontSize: 15.0),
                                )),
                                DataCell(Text(
                                  myPost['day4'],
                                  style: TextStyle(fontSize: 15.0),
                                )),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  'Friday',
                                  style: TextStyle(fontSize: 15.0),
                                )),
                                DataCell(Text(
                                  myPost['day5'],
                                  style: TextStyle(fontSize: 15.0),
                                )),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  'Saturday',
                                  style: TextStyle(fontSize: 15.0),
                                )),
                                DataCell(Text(
                                  myPost['day6'],
                                  style: TextStyle(fontSize: 15.0),
                                )),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  'Sunday',
                                  style: TextStyle(fontSize: 15.0),
                                )),
                                DataCell(Text(
                                  myPost['day7'],
                                  style: TextStyle(fontSize: 15.0),
                                )),
                              ]),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
