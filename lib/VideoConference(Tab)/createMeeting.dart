import 'dart:ui';

import 'package:floom/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:uuid/uuid.dart';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String code ='';

  createCode(){
    setState(() {
      code = Uuid().v1().substring(0,6);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text("Create a code and share it with your friends", style: mystyle(20),textAlign: TextAlign.center,),
            
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Code: ", style: mystyle(30),),
              Text(code, style: mystyle(30, Colors.purple, FontWeight.w700),)
            ],
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: ()=>createCode(),
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,

              decoration: BoxDecoration(
                gradient: LinearGradient(colors: GradientColors.orangePink),
              ),
              child: Center(
                child: Text("Generate Code", style: mystyle(20, Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
