import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/models/trainerauthentication.dart';
import 'package:provider/provider.dart';

class UploadInfoScreen extends StatefulWidget {
  @override
  _UploadInfoScreenState createState() => _UploadInfoScreenState();
}

class _UploadInfoScreenState extends State<UploadInfoScreen> {
  String image, name;
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _descriptioncontroller = new TextEditingController();

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
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Consumer<Trainerauthentication>(
                builder: (context, data, child) {
              return Column(children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: data.profileurl,
                    onSaved: (value) {
                      image = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter image url ',
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
                    initialValue: data.username,
                    onSaved: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter title ',
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
                    controller: _descriptioncontroller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter description';
                      }
                      return null;
                    },
                    maxLines: 5,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          String description = _descriptioncontroller.text;
                          Map<String, dynamic> data = {
                            "profile": image,
                            "name": name,
                            "info": description
                          };
                          String message = "information updated successfully";
                          FirebaseFirestore.instance
                              .collection("information")
                              .add(data)
                              .then((value) => _showSuccessfulMessage(message));
                        },
                      ),
                      hintText: 'Enter information ',
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
                  height: 25,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('information')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot myPost =
                                snapshot.data.documents[index];
                            return Stack(
                              children: <Widget>[
                                SingleChildScrollView(
                                  child: Card(
                                    color: Colors.red.shade200,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.red.shade200,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircleAvatar(
                                                  radius: 30.0,
                                                  backgroundImage:
                                                      '${myPost['profile']}' !=
                                                              null
                                                          ? NetworkImage(
                                                              '${myPost['profile']}')
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
                                            ListTile(
                                              subtitle: GestureDetector(
                                                  onTap: () {
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            "information")
                                                        .where("info",
                                                            isEqualTo:
                                                                myPost['info'])
                                                        .get()
                                                        .then((snapshot) =>
                                                            snapshot.docs.first
                                                                .reference
                                                                .delete());
                                                  },
                                                  child: Icon(Icons.delete)),
                                            )
                                          ],
                                        ),
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
              ]);
            })),
      ),
    );
  }
}
