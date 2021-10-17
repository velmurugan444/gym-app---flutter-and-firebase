import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Trainerauthentication with ChangeNotifier {
  String password, profileurl, username, rollno, mail, dob, address, mobile;
  uploadTrainerauthentication(String password) async {
    try {
      DatabaseReference db;
      db = FirebaseDatabase.instance.reference().child("TrainerRegistration");
      await db
          .orderByChild("password")
          .equalTo(password)
          .once()
          .then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, values) {
          print(values["profile url"]);
          print(values["Username"]);
          print(values["Rollno"]);
          print(values["mail"]);
          print(values["date of birth"]);
          print(values["address"]);
          print(values["mobile"]);
          profileurl = values["profile url"];
          username = values["Username"];
          rollno = values["Rollno"];
          mail = values["mail"];
          dob = values["date of birth"];
          address = values["address"];
          mobile = values["mobile"];
        });
      });

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
