import 'package:flutter/material.dart';
import 'package:gym_app/models/loginauthentication.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileImagePreview extends StatefulWidget {
  @override
  _ProfileImagePreviewState createState() => _ProfileImagePreviewState();
}

class _ProfileImagePreviewState extends State<ProfileImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Loginauthentication>(
      builder: (context,data,child){
      return Scaffold(
        appBar: AppBar(title:Text(data.username,style: GoogleFonts.lato())),
        body: Container(
          alignment: Alignment.center,
          child: Consumer<Loginauthentication>(
            builder:(context,data,child){
            return Image.network(data.profileurl);
            }
            ),
        ),
      );
      }
    );
  }
}