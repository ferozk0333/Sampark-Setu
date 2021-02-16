import 'package:floom/authentication/navigateauthscreen.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome to this amazing app",
          image: Center(
            child: Image.asset('images/welcome.png', height:175),
        ),
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),

          )),

        PageViewModel(
            title: "Join or Start a meeting",
            body: "Easy to use interface",
            image: Center(
              child: Image.asset('images/conference.png', height:175),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(20, Colors.black),

            )),

        PageViewModel(
            title: "Security",
            body: "Your security is important to us. Our servers are secure and reliable.",
            image: Center(
              child: Image.asset('images/secure.jpg', height:175),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(20, Colors.black),

            )),

      ],
      onDone: (){
        //This command sends the user to the home login page
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigateAuthScreen()));
      },
      onSkip: (){},
      showSkipButton: true,
      skip: const Icon(Icons.skip_next, size: 45),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text(
        "Done",style: mystyle(20, Colors.black),
      ),
    );
  }
}
