import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter post App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff543B7A),
      ),
      home: ContactScreen(),
    );
  }
}

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    void _ownerContact(DocumentSnapshot myPost) async {
      String number = myPost['mobile'];
      final url = "tel:$number";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Contact", style: GoogleFonts.lato()),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('ownerdetails').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Loading');
          } else {
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot myPost = snapshot.data.documents[index];
                  return Center(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image(
                              width: MediaQuery.of(context).size.width,
                              image: AssetImage("assets/contact.jpg"),
                            )),
                        SizedBox(height: 40),
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  elevation: 0,
                                  shadowColor: Colors.grey,
                                  color: Colors.white10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Form(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextFormField(
                                          initialValue: '${myPost['username']}',
                                          enabled: false,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons
                                                .supervised_user_circle_outlined),
                                            hintText: 'Enter Username',
                                            hintStyle: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            fillColor: Colors.white30,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          initialValue: '${myPost['mail']}',
                                          enabled: false,
                                          decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.message_outlined),
                                            hintText: 'Enter Address',
                                            hintStyle: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            fillColor: Colors.white30,
                                            filled: false,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          initialValue: '${myPost['address']}',
                                          maxLines: 3,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                Icons.description_outlined),
                                            hintText: 'Enter Mail',
                                            hintStyle: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            fillColor: Colors.white30,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          initialValue: '${myPost['mobile']}',
                                          enabled: true,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                Icons.contact_page_outlined),
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  _ownerContact(myPost);
                                                },
                                                child: Icon(Icons.phone)),
                                            hintText: 'Enter mobile',
                                            hintStyle: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            fillColor: Colors.white30,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              borderSide: BorderSide(
                                                  color: Colors.grey[50]),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
