import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class SpecialWorkoutScreen extends StatefulWidget {
  final String rollno;
  SpecialWorkoutScreen({this.rollno});

  @override
  _SpecialWorkoutScreenState createState() => _SpecialWorkoutScreenState();
}

class _SpecialWorkoutScreenState extends State<SpecialWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Special workouts", style: GoogleFonts.lato()),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('workouts')
            .where('rollno', isEqualTo: widget.rollno)
            .
            // ignore: deprecated_member_use
            snapshots(),
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
                          padding: const EdgeInsets.only(top: 80.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
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
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['monday'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Tuesday',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['tuesday'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(
                                    Text(
                                      'Wednesday',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                  DataCell(Text(
                                    myPost['wednesday'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Thrusday',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['thursday'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Friday',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['friday'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Saturday',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['saturday'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Sunday',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['sunday'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                              ],
                            ),
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
