import 'package:flutter/material.dart';
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

  Widget devspaceTriangle(){
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/Triangle_white.png'),
          fit: BoxFit.contain
        )
      ),
    );
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
        tracksPressedListner: (){Navigator.pushNamedAndRemoveUntil(context, '/tracks',(Route<dynamic> route)=>false);},
        profilePressedListner: (){Navigator.pushNamedAndRemoveUntil(context, '/profile',(Route<dynamic> route)=>false);},
      ),
      floatingActionButton: FloatingActionButton(
        child: devspaceTriangle(),
        backgroundColor: const Color(0xff107cfe),
        onPressed: (){triggerBottomModalSheet(
          context:context,
          eventHandler1: (){},
          eventHandler2: (){Navigator.pushNamedAndRemoveUntil(context, '/codespace',(Route<dynamic> route)=>false);},
          eventHandler3: (){Navigator.pushNamedAndRemoveUntil(context, '/events',(Route<dynamic> route)=>false);},
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
      description: "At Anna Auditorium",
      title: "9:00-10:00 - Registrations",
    ),
    TimelineModel(
      id: "2",
      description: "At Anna Auditorium",
      title: "10:30-11:30 - Opening Ceremony",
    ),
    TimelineModel(
      id: "3",
      description: "Lawrence Mohanraj (IBM) - Embracing innovation in the digital era",
      title: "11:30-12:30 - Keynote",
    ),
    TimelineModel(
      id: "4",
      description: "Mohan Raj (Digital Ocean) - Simplifying the Cloud",
      title: "Talk"
    ),
    TimelineModel(
      id: "5",
      description: "Sohan Maheshwar (Amazon) - Rise of Voice Interface",
      title: "13:45-16:45 - Workshop",
    ),
    TimelineModel(
      id: "6",
      description: "Prateek Narang (Coding Blocks) - Competitive Coding",
      title: "17:00-20:00 - Workshop",
    ),
  ];
  return list;
}

List<TimelineModel> day2List(){
  List<TimelineModel> list = [
    TimelineModel(
      id: "1",
      description: "Viswaprasath KS (Mozilla) - Web AR",
      title: "10:00-11:00 - Talk",
    ),
    TimelineModel(
      id: "2",
      description: "Branch - Deep Linking",
      title: "11:00-12:00 - Talk",
    ),
    TimelineModel(
      id: "3",
      description: "IBM - Watson",
      title: "13:30-16:30 - Workshop",
    ),
    TimelineModel(
      id: "4",
      description: "At CS Hall",
      title: "16:30-18:30 - Codespace Registrations",
    ),
    TimelineModel(
      id: "5",
      description: "At Anna Auditorium",
      title: "18:30-20:00 - Codespace Introduction",
    ),
    TimelineModel(
      id: "6",
      description: "At CS Hall",
      title: "22:00:23:00 - Dinner",
    ),
    TimelineModel(
      id: "7",
      description: "At Anna Auditorium",
      title: "23:00 - Team Finalisation",
    ),
  ];
  return list;
}

List<TimelineModel> day3List(){
  List<TimelineModel> list = [
    TimelineModel(
      id: "1",
      description: "At CS Hall.",
      title: "04:00 - Snacks",
    ),
    TimelineModel(
      id: "2",
      description: "At Anna Auditorium.",
      title: "10:00 - Code Review",
    ),
    TimelineModel(
      id: "3",
      description: "At CS Hall.",
      title: "13:30 - Lunch",
    ),
    TimelineModel(
      id: "4",
      description: "At CS Hall.",
      title: "16:00 - Final Presentations",
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