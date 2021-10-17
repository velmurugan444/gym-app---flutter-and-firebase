import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ResultUploadScreen extends StatefulWidget {
  @override
  _ResultUploadScreenState createState() => _ResultUploadScreenState();
}

class _ResultUploadScreenState extends State<ResultUploadScreen> {
  File sampleImage;
  String _myValue;
  String _height;
  String _weight;
  String _rollno;
  String url;
  final formKey = new GlobalKey<FormState>();

  Future getImage() async {
    // ignore: deprecated_member_use
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      sampleImage = tempImage;
    });
  }

  bool validateandSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void uploadResult() async {
    if (validateandSave()) {
      final postImageRef = FirebaseStorage.instance.ref().child("Post Images");

      var timeKey = DateTime.now();

      final StorageUploadTask uploadTask =
          postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);
      var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      url = imageUrl.toString();
      print("Image Url =" + url);

      saveToDatabase(url);
    }
  }

  void _showSuccessfulMessage(String inputmessage) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('From Mr.Fitness Gym'),
        content: Text(inputmessage),
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

  void saveToDatabase(url) {
    var dbTimeKey = new DateTime.now();
    var formatDate = new DateFormat('MMM d, yyyy');
    var formatTime = new DateFormat('EEEE, hh:mm aaa');
    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "image": url,
      "studentrollno": _rollno,
      "description": _myValue,
      "height": _height,
      "weight": _weight,
      "date": date,
      "time": time,
    };
    ref.child("posts").push().set(data);
    String message = "Post was uploaded successfully";
    _showSuccessfulMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Result"),
      ),
      body: Center(
        child: sampleImage == null ? Text("Select an image") : enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add Image',
        child: Icon(Icons.add_a_photo),
        onPressed: getImage,
      ),
    );
  }

  Widget enableUpload() {
    return SingleChildScrollView(
      child: Container(
          child: new Form(
        key: formKey,
        child: Column(children: <Widget>[
          Image.file(sampleImage, height: 330.0, width: 660.0),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(labelText: "Enter student rollno"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Student rollno is required';
              }
              return null;
            },
            onSaved: (value) {
              return _rollno = value;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(labelText: "Enter the day"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Blog description is required';
              }
              return null;
            },
            onSaved: (value) {
              return _myValue = value;
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Enter Height of student"),
            validator: (value) {
              if (value.isEmpty) {
                return 'student height is required';
              }
              return null;
            },
            onSaved: (value) {
              return _height = value;
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Enter Weight of student"),
            validator: (value) {
              if (value.isEmpty) {
                return 'student weight is required';
              }
              return null;
            },
            onSaved: (value) {
              return _weight = value;
            },
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            elevation: 10.0,
            child: Text("Upload"),
            textColor: Colors.white,
            color: Colors.red,
            onPressed: uploadResult,
          ),
        ]),
      )),
    );
  }
}
