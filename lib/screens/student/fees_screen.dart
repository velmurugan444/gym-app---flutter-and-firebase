import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeesScreen extends StatefulWidget {
  final String image;
  final String username;
  final String rollno;
  final String mailid;
  final String dob;
  final String address;
  final String mobile;
  FeesScreen({
    this.image,
    this.username,
    this.rollno,
    this.mailid,
    this.dob,
    this.address,
    this.mobile,
  });
  @override
  _FeesScreenState createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fee Status"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('fees')
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
                                    'Payment Date',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['payment date'],
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
                                    'Amount',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['amount'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Payment Month',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['month'],
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Status',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                                  DataCell(Text(
                                    myPost['paymentstatus'],
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
