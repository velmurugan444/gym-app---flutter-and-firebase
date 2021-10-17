import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentDateAttendanceScreen extends StatefulWidget {
  final String rollno;
  CurrentDateAttendanceScreen({this.rollno});

  @override
  _CurrentDateAttendanceScreenState createState() =>
      _CurrentDateAttendanceScreenState();
}

class _CurrentDateAttendanceScreenState
    extends State<CurrentDateAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now(); //current date
    DateFormat formatter = DateFormat('dd-MM-yyy'); // use any format
    String formatted = formatter.format(now);
    print(formatted);
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Status", style: GoogleFonts.lato()),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('attendance')
            .where('date', isEqualTo: formatted)
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
                                    'Date',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['date'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Name',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['name'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(
                                    Text(
                                      'Rollno',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                  DataCell(Text(
                                    myPost['rollno'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Status',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['status'],
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
