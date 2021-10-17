import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information", style: GoogleFonts.lato()),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('information').snapshots(),
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
                      Card(
                        color: Colors.red.shade200,
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red.shade200,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: '${myPost['profile']}' !=
                                              null
                                          ? NetworkImage('${myPost['profile']}')
                                          : '${myPost['profile']}'),
                                  subtitle: Text(
                                    '${myPost['info']}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
