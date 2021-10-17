import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_app/screens/student/imagedetail_screen.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('post').snapshots(),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0,
                                shadowColor: Color(0x802196F3),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: GestureDetector(
                                            onTap: () {
                                              String title =
                                                  '${myPost['title']}';
                                              String image =
                                                  '${myPost['image']}';
                                              Navigator.push(
                                                  context,
                                                  new MaterialPageRoute(
                                                      builder: (context) =>
                                                          new ImagePreview(
                                                              title: title,
                                                              image: image)));
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: Image.network(
                                                '${myPost['image']}',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '${myPost['title']}',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '${myPost['description']}',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
