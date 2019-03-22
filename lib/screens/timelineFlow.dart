import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceAppbar.dart';
import 'package:devspace_app/widgets/notchedBar.dart';
import 'package:devspace_app/widgets/circularBottomSheet.dart';
import 'package:devspace_app/widgets/devspaceTabBar.dart';
import 'package:timeline/timeline.dart';
import 'package:timeline/model/timeline_model.dart';

class TimelineFlow extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TimelineFlowState();
  }
}

class TimelineFlowState extends State<TimelineFlow> with SingleTickerProviderStateMixin{
  
  final List<Tab> tabs = <Tab>[
    new Tab(text:'Day 1'),
    new Tab(text:'Day 2'),
    new Tab(text:'Day 3')
  ];

  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController =TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: devspaceTabBar(
        context: context,
        eventHandler: (){},
        enabled: true,
        tabController: _tabController,
        tabs : tabs,
        autoImplyLeading: false
      ),
      bottomNavigationBar: notchedBar(
        tracksPressedListner: (){},
        profilePressedListner: (){},
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        backgroundColor: const Color(0xff107cfe),
        onPressed: (){triggerBottomModalSheet(
          context:context,
          eventHandler1: (){},
          eventHandler2: (){Navigator.pushNamedAndRemoveUntil(context, '/codespace',(Route<dynamic> route)=>false);},
          eventHandler3: (){},
          asset1: 'lib/assets/itinerarybg.png',
          asset2: 'lib/assets/tri_cir_sq_bg.png',
          asset3: 'lib/assets/micbg.png', 
          selectedIndex: 1, 
        );},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _timelineLayout(context,tabs,_tabController),
    );
  }
}

Widget _timelineLayout(context,List<Tab> tabs,controller){
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
      children: <Widget>[
        TabBarView(
          controller: controller,
          children: tabs.map(
            (Tab tab){
              if(tab.text=="Day 1"){
                return timelineComponent(day1List());
              }
              else if(tab.text=="Day 2"){
                return timelineComponent(day2List());
              }
              else{
                return timelineComponent(day3List());
              }
            }
          ).toList(),
        )
      ],
    ),
  );
}

Widget timelineComponent(list){
  return TimelineComponent(
    backgroundColor: Colors.transparent,
    timelineList: list,
    lineColor: const Color(0xff107cfe),
    headingColor: const Color(0xffffffff),
    descriptionColor: const Color(0xfffafafa),
  );
}

List<TimelineModel> day1List(){
  List<TimelineModel> list = [
    TimelineModel(
      id: "1",
      description: "At Anna Auditorium.",
      title: "7:00-9:00 - Report",
    ),
    TimelineModel(
      id: "2",
      description: "At Anna Auditorium.",
      title: "9:00-10:00 - Participants Arrive",
    ),
    TimelineModel(
      id: "3",
      description: "At Anna Auditorium.",
      title: "10:00-11:30 - Opening Ceremoy",
    ),
    TimelineModel(
      id: "4",
      description: "At Anna Auditorium.",
      title: "12:00-13:00 - Keynote (Lawrence-IBM)",
    ),
    TimelineModel(
      id: "5",
      description: "Amazon - Rise of Voice Interface",
      title: "14:00-15:00 - Talk (Sohan Maheshwar)",
    ),
    TimelineModel(
      id: "6",
      description: "At Anna Auditorium.",
      title: "15:15-16:00 - Talk (Edureka)",
    ),
    TimelineModel(
      id: "7",
      description: "Coding Blocks - Competitive Coding",
      title: "16:15-19:15 - Workshop (Prateek Narang)",
    ),
    TimelineModel(
      id: "8",
      description: "TBD",
      title: "19:30-21:00 - Talk (Microsoft)",
    ),
  ];
  return list;
}

List<TimelineModel> day2List(){
  List<TimelineModel> list = [
    TimelineModel(
      id: "1",
      description: "At Anna Auditorium.",
      title: "7:00-9:30 - Report",
    ),
    TimelineModel(
      id: "2",
      description: "At Anna Auditorium.",
      title: "9:30-10:00 - Participants Arrive",
    ),
    TimelineModel(
      id: "3",
      description: "IBM - Deep Learning and Watson",
      title: "10:00-13:00 - Workshop (Siraj Rawal)",
    ),
    TimelineModel(
      id: "4",
      description: "Mozilla - WebAR",
      title: "14:00-15:00 - Talk (Vishwaprasath KS)",
    ),
    TimelineModel(
      id: "5",
      description: "Google - TBD",
      title: "15:15-16:30 - Talk (TBD)",
    ),
    TimelineModel(
      id: "6",
      description: "At CS Hall.",
      title: "16:30-19:00 - Codespace Registrations",
    ),
    TimelineModel(
      id: "7",
      description: "By Ex-Google Dev",
      title: "19:00 - Codespace Begins!",
    ),
  ];
  return list;
}

List<TimelineModel> day3List(){
  List<TimelineModel> list = [
    TimelineModel(
      id: "1",
      description: "At Anna Auditorium.",
      title: "7:00-9:00 - Report",
    ),
    TimelineModel(
      id: "2",
      description: "At Anna Auditorium.",
      title: "9:00-10:00 - Participants Arrive",
    ),
    TimelineModel(
      id: "3",
      description: "At Anna Auditorium.",
      title: "10:00-11:30 - Opening Ceremoy",
    ),
    TimelineModel(
      id: "4",
      description: "At Anna Auditorium.",
      title: "12:00-13:00 - Keynote (Lawrence-IBM)",
    ),
    TimelineModel(
      id: "5",
      description: "Amazon - Rise of Voice Interface",
      title: "14:00-15:00 - Talk (Sohan Maheshwar)",
    ),
    TimelineModel(
      id: "6",
      description: "At Anna Auditorium.",
      title: "15:15-16:00 - Talk (Edureka)",
    ),
    TimelineModel(
      id: "7",
      description: "Coding Blocks - Competitive Coding",
      title: "16:15-19:15 - Workshop (Prateek Narang)",
    ),
    TimelineModel(
      id: "8",
      description: "TBD",
      title: "19:30-21:00 - Talk (Microsoft)",
    ),
  ];
  return list;
}

Widget roundedButtons({context,eventHandler1,eventHandler2,eventHandler3,asset1,asset2,asset3}){
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:65.0,left:5.0),
              child: roundedButtonMaterial(context,eventHandler1,asset1),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text('Itinerary'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:35.0,top:15.0),
              child: roundedButtonMaterial(context,eventHandler2,asset2),
            ),
            Padding(
              padding: const EdgeInsets.only(left:200.0,top:15.0),
              child: roundedButtonMaterial(context,eventHandler3,asset3),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:25.0,top:8.0),
              child: Text('Codespace'),
            ),
            Padding(
              padding: const EdgeInsets.only(left:130.0,top:1.0),
              child: Text('Talks & Workshops'),
            )
          ],
        )
      ],
    ),
  );
}

Widget roundedButtonMaterial(context,eventHandler,asset){
  return GestureDetector(
    onTap: eventHandler,
    child: Container(
      width:55,
      height:55,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.fitHeight,
        )
      ),
    )
  );
}