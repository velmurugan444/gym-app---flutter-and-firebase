import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/screens/trainer/postupload_screen.dart';
import 'package:gym_app/screens/trainer/postviedo_screen.dart';
import 'package:gym_app/screens/trainer/uploadinfo_screen.dart';

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: PostUploadScreen()),
    Center(
      child: ViedoUploadScreen(),
    ),
    Center(child: UploadInfoScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Datas',
          style: GoogleFonts.lato(),
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),

            // ignore: deprecated_member_use
            title: Text('Post'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_rounded),

            // ignore: deprecated_member_use
            title: Text('Viedo'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            // ignore: deprecated_member_use
            title: Text('Info'),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (
          index,
        ) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
