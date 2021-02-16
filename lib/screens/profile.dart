import 'package:cloud_firestore/cloud_firestore.dart'; //for DocumentSnapshot
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username ='';
  bool dataisthere = false;
  TextEditingController usernamecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  getuserdata() async { //async?
    DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      username = userdoc.data()['username']; // username is the key and returns value
      dataisthere = true;
    });
  }

  editprofile() async{
    usercollection.doc(FirebaseAuth.instance.currentUser.uid).update({
      'username': usernamecontroller.text //Backend update
    });
    setState(() {
      username = usernamecontroller.text; //Frontend Update
    });
    Navigator.pop(context);

  }


  openeditprofiledialog() async{
    return showDialog(
      context: context,
      builder: (context){
        return Dialog(
          child: Container(
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(100)
            // ),
            height: 200,
            color: Colors.white10,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: usernamecontroller,
                    style: mystyle(18, Colors.black),

                    decoration: InputDecoration(
                      labelText: "Update Username",
                      labelStyle: mystyle(16, Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  onTap: ()=>editprofile(),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: GradientColors.orangePink),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text("Update now!", style: mystyle(17, Colors.white),),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: dataisthere ==false? Center(
        child: CircularProgressIndicator(),
      ): Stack(
        children: [ //Clippers from Flutter custom clipper package
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: GradientColors.orangePink),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width/2-75,
              top: MediaQuery.of(context).size.height/3.1,
            ),
            child: CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                'https://pbs.twimg.com/media/EYVxlOSXsAExOpX.jpg'
              ),
          )
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 350,),
                Text(username, style: mystyle(23, Colors.black), textAlign: TextAlign.center,),
                SizedBox(height: 35,),
                InkWell(
                  onTap: ()=>openeditprofiledialog()(),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: GradientColors.cherry),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text('Edit Profile', style: mystyle(17, Colors.white),),

                  ),
                  ),
                ),
                SizedBox(height: 18,),


                InkWell(
                  onTap: (){
                    FirebaseAuth.instance.signOut();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 40,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: GradientColors.cherry),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text('Log Out', style: mystyle(17, Colors.white),),

                    ),
                  ),
                )




              ],
            ),
          )

        ],
      ),
    );
  }
}
