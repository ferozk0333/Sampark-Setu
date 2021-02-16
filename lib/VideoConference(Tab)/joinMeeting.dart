import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floom/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class JoinMeeting extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController roomcontroller = TextEditingController();
  bool isVideoMuted = true;
  bool isAudioMuted = true;
  String username = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  getuserdata() async {
    //async?
    DocumentSnapshot userdoc =
        await usercollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      username =
          userdoc.data()['username']; // username is the key and returns value
    });
  }

  JoinMeeting() async {
    //BACKEND
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      if (Platform.isAndroid) {
        featureFlag.callIntegrationEnabled =
            false; //Doesn't work so well with Android
      } else if (Platform.isIOS) {
        featureFlag.pipEnabled = false;
      }

      var options =
          JitsiMeetingOptions() //Get name from DB or else from the text field
            ..room = roomcontroller.text
            ..userDisplayName =
                namecontroller.text == '' ? username : namecontroller.text
            ..audioMuted = isAudioMuted
            ..videoMuted = isVideoMuted
            ..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(


        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(
                height: 24,
              ),
              Text(
                "Meeting Code",
                style: mystyle(20),
              ),
              SizedBox(
                height: 20,
              ),


              PinCodeTextField(
                appContext: context,
                controller: roomcontroller,
                length: 6,
                autoDisposeControllers: false,
                animationType: AnimationType.fade, //IMPORTANT
                pinTheme: PinTheme(shape: PinCodeFieldShape.box),
                animationDuration: Duration(milliseconds: 300),
                onChanged: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: namecontroller,
                style: mystyle(20),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Rename for this meeting as",
                    labelStyle: mystyle(15)),
              ),
              SizedBox(
                height: 16,
              ),
              CheckboxListTile(
                value: isVideoMuted,
                onChanged: (value) {
                  setState(() {
                    isVideoMuted = value;
                  });
                },
                title: Text(
                  "Video off",
                  style: mystyle(20, Colors.black),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                // width: MediaQuery.of(context).size.width/1.4,
                child: CheckboxListTile(
                  value: isAudioMuted,
                  onChanged: (value) {
                    setState(() {
                      isAudioMuted = value;
                    });
                  },
                  title: Text(
                    "Mic off",
                    style: mystyle(20, Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "You can also customise these settings in the meeting",
                style: mystyle(15),
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 30,
                thickness: 2.0,
              ),
              InkWell(
                onTap: () => JoinMeeting(),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: GradientColors.orangePink),
                  ),
                  child: Center(
                    child: Text(
                      "Join Meeting",
                      style: mystyle(20, Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
