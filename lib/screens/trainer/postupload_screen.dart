import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostUploadScreen extends StatefulWidget {
  @override
  _PostUploadScreenState createState() => _PostUploadScreenState();
}

class _PostUploadScreenState extends State<PostUploadScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _imagecontroller = new TextEditingController();
  TextEditingController _titlecontroller = new TextEditingController();
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

  void submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    String image = _imagecontroller.text;
    String title = _titlecontroller.text;
    String description = _descriptioncontroller.text;
    Map<String, dynamic> data = {
      "image": image,
      "title": title,
      "description": description
    };
    String message = "post was updated successfully";
    FirebaseFirestore.instance
        .collection("post")
        .add(data)
        .then((value) => _showSuccessfulMessage(message));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _imagecontroller,
                validator: (value) {
                  if (!value.endsWith("jpg")) {
                    return 'Enter valid url';
                  }
                  return null;
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
                controller: _titlecontroller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter title';
                  }
                  return null;
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
                decoration: InputDecoration(
                  hintText: 'Enter description ',
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
            RaisedButton(
                onPressed: () {
                  submit();
                },
                color: Colors.red.shade400,
                child: Text("Upload"))
          ]),
        ),
      ),
    );
  }
}
