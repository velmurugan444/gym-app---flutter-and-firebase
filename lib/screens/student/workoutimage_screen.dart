import 'package:flutter/material.dart';
class WorkoutImageScreen extends StatefulWidget {
  final String image;
  final String day;
  WorkoutImageScreen({this.image,this.day});
  @override
  _WorkoutImageScreenState createState() => _WorkoutImageScreenState();
}

class _WorkoutImageScreenState extends State<WorkoutImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.day}"),),
      body: Center(
        child:Image.network(widget.image,),
      ),
    );
  }
}