import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ImagePreview extends StatelessWidget {
 final String image;
 final String title;

 ImagePreview({this.title,this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('$title',style: GoogleFonts.lato())),
      body:   Container(
              alignment: Alignment.center,
            child: Image.network(image),
    
          ),
      
      );
  }
}