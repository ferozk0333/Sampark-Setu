import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:floom/screens/home.dart';
import 'package:floom/screens/introauthscreen.dart';
import 'package:introduction_screen/introduction_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    ); //MaterialApp
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned =false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) { //it notifies about changes to state, signed in or not already
      if(user!=null){
        setState(() {
          isSigned=true;
        });
      } else{
        setState(() {
          isSigned = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSigned ==false? IntroAuthScreen() : HomePage(),
    );
  }
}

