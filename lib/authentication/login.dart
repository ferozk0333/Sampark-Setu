import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:floom/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernamecontroller =TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[250],
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: GradientColors.grey)
              ),
              child: Center(
                child: Image.asset(
                  'images/logo.png',
                  height: 75,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter, //White rounded corner container with two buttons
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.6, //Mediaquery makes it responsive and dynamic
                margin: EdgeInsets.only(left: 30,right: 30), //cut off margins
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 20,),
                    // Container(
                    //   width: MediaQuery.of(context).size.width/1.7,
                    //   child: TextField(
                    //     style: mystyle(18, Colors.black),
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //       hintText: "Enter your Email",
                    //       prefixIcon: Icon(Icons.email),
                    //       hintStyle: mystyle(20, Colors.grey, FontWeight.w700),
                    //       ),
                    //     ),
                    //   ),


                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width/1.7,
                      child: TextField(
                        style: mystyle(18, Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                          hintText: "Username",
                          prefixIcon: Icon(Icons.person),
                          hintStyle: mystyle(20, Colors.grey, FontWeight.w700),
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width/1.7,
                      child: TextField(
                        style: mystyle(18, Colors.black),
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          hintStyle: mystyle(20, Colors.grey, FontWeight.w700),
                        ),

                      ),
                    ),


                    SizedBox(height: 40,),


                    InkWell(
                      onTap: (){
                        try{
                          int count =0;
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: usernamecontroller.text, password: passwordcontroller.text);
                          Navigator.popUntil(context, (route) {
                            return count++ ==2;
                          });
                        } catch(e) {
                          print(e);
                          var snackbar = SnackBar(content: Text(e.toString(), style: mystyle(20),),);
                          Scaffold.of(context).showSnackBar(snackbar);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: GradientColors.beautifulGreen
                          ),
                          borderRadius: BorderRadius.circular(20),//Sign in button
                        ),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: mystyle(20, Colors.white),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )

          ],
        )
    );
  }
}
