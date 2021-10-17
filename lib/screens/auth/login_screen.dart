import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/models/authentication.dart';
import 'package:gym_app/models/loginauthentication.dart';
import 'package:gym_app/models/trainerauthentication.dart';
import 'package:gym_app/screens/auth/signup_screen.dart';
import 'package:gym_app/screens/student/home_screen.dart';
import 'package:gym_app/screens/trainer/Trainerhome_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool valuefirst = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  DatabaseReference db;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (valuefirst == true) {
      try {
        var function =
            Provider.of<Trainerauthentication>(context, listen: false);
        await function.uploadTrainerauthentication(_authData["password"]);

        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new TrainerHomeScreen()));
      } catch (error) {
        String message = "Authentication failed!please try again later";
        showErrorDialog(message);
      }
    } else {
      try {
        await Provider.of<Authentication>(context, listen: false)
            .logIn(_authData['email'], _authData['password']);
        var function = Provider.of<Loginauthentication>(context, listen: false);
        function.uploadTrainerauthentication(_authData["password"]);
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new HomeScreen()));
      } catch (error) {
        String errorMessage = "Authentication Failed!Please try again later";
        showErrorDialog(errorMessage);
      }
    }
  }

  void showErrorDialog(String errorMessage) {
    print(errorMessage);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured'),
        content: Text(errorMessage),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            top: 300,
            child: Text(
              "Login",
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
              top: 350,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    new TextFormField(
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
                      onSaved: (value) {
                        _authData['email'] = value;
                      },
                      validator: (val) {
                        if (val.length == 0) {
                          return "Username cannot be empty";
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
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
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
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text(
                        "Check if you are a trainer",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: this.valuefirst,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuefirst = value;
                        });
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                          child: Text(
                            "Login",
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
                    ),
                    SizedBox(height: 100),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new SignupScreen()));
                      },
                      child: Text("New User? Create Account",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    )
                  ]),
                ),
              )),
        ],
      ),
    );
  }
}
