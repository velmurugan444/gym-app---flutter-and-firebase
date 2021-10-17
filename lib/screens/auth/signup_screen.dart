import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/models/authentication.dart';
import 'package:gym_app/screens/auth/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  File sampleImage;
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _usernamecontroller,
      _rollnocontroller,
      _mailcontroller,
      _passwordcontroller,
      _dateofbirthcontroller,
      _addresscontroller,
      _mobilecontroller;
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _usernamecontroller = TextEditingController();
    _rollnocontroller = TextEditingController();
    _mailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();

    _dateofbirthcontroller = TextEditingController();
    _addresscontroller = TextEditingController();
    _mobilecontroller = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Registration');
  }

  Map<String, String> _authData = {'email': '', 'password': ''};

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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new LoginScreen()));
            },
          )
        ],
      ),
    );
  }

  void _showErrorDialog(String msg) {
    print(msg);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future getImage() async {
    // ignore: deprecated_member_use
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      sampleImage = tempImage;
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      await Provider.of<Authentication>(context, listen: false)
          .signUp(_authData['email'], _authData['password']);
      final postImageRef =
          FirebaseStorage.instance.ref().child("Profile Images");

      var timeKey = DateTime.now();

      final StorageUploadTask uploadTask =
          postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);
      var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      String url = imageUrl.toString();
      print("Image Url =" + url);
      String username = _usernamecontroller.text;
      String rollno = _rollnocontroller.text;
      String mail = _mailcontroller.text;
      String password = _passwordcontroller.text;
      String profileurl = url;
      String dateofbirth = _dateofbirthcontroller.text;
      String address = _addresscontroller.text;
      String mobile = _mobilecontroller.text;

      Map<String, String> registration = {
        "Username": username,
        "Rollno": rollno,
        "mail": mail,
        "password": password,
        "profile url": profileurl,
        "date of birth": dateofbirth,
        "address": address,
        "mobile": mobile,
      };
      String message = "Your Registration was Successful.";
      _ref
          .push()
          .set(registration)
          .then((value) => _showSuccessfulMessage(message));
    } catch (error) {
      var errorMessage = "Account already exists";
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mr.Fitness"),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 24,
            top: 250,
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width / 25,
              right: MediaQuery.of(context).size.width / 25,
              top: 300,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    new TextFormField(
                      controller: _usernamecontroller,
                      decoration: new InputDecoration(
                        labelText: "User name",
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.red,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "firstname cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    new TextFormField(
                      controller: _rollnocontroller,
                      decoration: new InputDecoration(
                        labelText: "Enter Rollno",
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Rollno cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    new TextFormField(
                      controller: _mailcontroller,
                      decoration: new InputDecoration(
                        labelText: "Enter Email",
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                        //fillColor: Colors.green
                      ),
                      onSaved: (value) {
                        _authData['email'] = value;
                      },
                      validator: (val) {
                        if (val.length == 0) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    new TextFormField(
                      controller: _passwordcontroller,
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Password cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: getImage,
                        child: Text("+ Add Profile "),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    new TextFormField(
                      controller: _dateofbirthcontroller,
                      decoration: new InputDecoration(
                        labelText: "Enter DOB",
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                        //fillColor: Colors.green
                      ),
                      onTap: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());

                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        var formattedDate =
                            "${date.day}-${date.month}-${date.year}";
                        _dateofbirthcontroller.text = formattedDate.toString();
                      },
                      validator: (val) {
                        if (val.length == 0) {
                          return "date of birth cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    new TextFormField(
                      controller: _addresscontroller,
                      decoration: new InputDecoration(
                        labelText: "Enter Address",
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Address cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    new TextFormField(
                      controller: _mobilecontroller,
                      decoration: new InputDecoration(
                        labelText: "Enter Mobile",
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Mobile cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Colors.transparent,
                          splashColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(color: Colors.white, width: 1)),
                          onPressed: () {
                            _submit();
                          }),
                    )
                  ]),
                ),
              )),
        ],
      ),
    );
  }
}
