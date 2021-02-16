import 'package:firebase_auth/firebase_auth.dart';
import 'package:floom/screens/profile.dart';
import 'package:floom/screens/videoconference.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page =0;
  List pageoptions =[
    VideoConference(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white, //Home screen
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrange,
        selectedLabelStyle: mystyle(17, Colors.red),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: mystyle(17, Colors.black),
        currentIndex: page,
        onTap: (index){
          setState(() {
            page =index;
          });
        },

        items: [
          // BottomNavigationBarItem(
          //   title: Text("Home"),
          //   icon: Icon(Icons.home, size: 32), //Text and Icon are widgets
          // ),
          BottomNavigationBarItem(
              title: Text("Meeting"),
              icon: Icon(Icons.video_call_outlined, size: 32), //Text and Icon are widgets
          ),
          // BottomNavigationBarItem(
          //   title: Text("Notes"),
          //   icon: Icon(Icons.book, size: 32), //Text and Icon are widgets
          // ),
          BottomNavigationBarItem(
            title: Text("Settings"),
            icon: Icon(Icons.settings, size: 32), //Text and Icon are widgets
          ),

      ],
      ),
      body: pageoptions[page],
    );
  }
}
