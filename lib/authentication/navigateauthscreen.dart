import 'package:floom/authentication/login.dart';
import 'package:floom/authentication/signup.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:sign_button/sign_button.dart';

class NavigateAuthScreen extends StatefulWidget {
  @override
  _NavigateAuthScreenState createState() => _NavigateAuthScreenState();
}

class _NavigateAuthScreenState extends State<NavigateAuthScreen> {
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
                  InkWell( //Gestures - What happens when you touch the button
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 60,
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
                  SizedBox(height: 40,),//spacing between two buttons
                  InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen())),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: GradientColors.aqua
                        ),
                        borderRadius: BorderRadius.circular(20),//Sign in button
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            // spreadRadius: 5,
                            // blurRadius: 13,
                            // offset: const Offset(5, 5),
                          )
                        ]

                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: mystyle(20, Colors.white),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 40,),
                  SignInButton(
                      buttonType: ButtonType.google,
                      btnColor: Colors.grey,
                      btnTextColor: Colors.black,
                      buttonSize: ButtonSize.medium,

                      elevation: 10,
                      onPressed: () {
                        print('click');
                      })





                ],
              ),
            ),
          )

        ],
      )
    );
  }
}
