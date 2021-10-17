import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/models/trainerauthentication.dart';
class ImagePreview extends StatefulWidget {
  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Trainerauthentication>(
      builder: (context,data,child){
      return Scaffold(
        appBar: AppBar(title:Text(data.username,style: GoogleFonts.lato())),
        body: Container(
          alignment: Alignment.center,
          child: Consumer<Trainerauthentication>(
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