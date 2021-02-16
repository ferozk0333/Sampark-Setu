import 'package:floom/VideoConference(Tab)/createMeeting.dart';
import 'package:floom/VideoConference(Tab)/joinMeeting.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class VideoConference extends StatefulWidget {
  @override
  _VideoConferenceState createState() => _VideoConferenceState();
}

class _VideoConferenceState extends State<VideoConference>
    with SingleTickerProviderStateMixin{

  TabController tabController;

  buildtab(String name) {
    return Container(


      width: 160,
        height: 50,

      child: Card(
        child: Center(

          child: Text(name, style: mystyle(17, Colors.black, FontWeight.w500),),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this); //IMPORTANT- Only 2 tabs so length is 2
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        centerTitle: true,
        backgroundColor: Colors.red,




        title: Text('Zoom', style: mystyle(30, Colors.black, FontWeight.w700),),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            buildtab("Join Meeting"),
            buildtab("Create Meeting")
          ],
        ),
      ),

      body: TabBarView(controller: tabController, children: [
        JoinMeeting(),
        CreateMeeting()

      ],),

    );
  }
}
