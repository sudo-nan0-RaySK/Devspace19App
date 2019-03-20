import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceAppbar.dart';
import 'package:devspace_app/widgets/notchedBar.dart';
import 'package:devspace_app/widgets/circularBottomSheet.dart';

class TimelineFlow extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TimelineFlowState();
  }
}

class TimelineFlowState extends State<TimelineFlow>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: devspaceAppBar(context, (){}, true),
      bottomNavigationBar: notchedBar(
        tracksPressedListner: (){},
        profilePressedListner: (){},
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        backgroundColor: const Color(0xff107cfe),
        onPressed: (){triggerBottomModalSheet(context, null);},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: _timelineLayout(context),
      ),
    );
  }
}

Widget _timelineLayout(context){
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('lib/assets/conf.png'),
        fit: BoxFit.cover,
      )
    ),
    child: Stack(
      children: <Widget>[],
    ),
  );
}
