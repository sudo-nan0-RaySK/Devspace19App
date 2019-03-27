import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/notchedBar.dart';
import 'package:devspace_app/widgets/circularBottomSheet.dart';
import 'package:devspace_app/widgets/devspaceTabBar.dart';
import 'package:timeline/timeline.dart';
import 'package:timeline/model/timeline_model.dart';

class Events extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EventsState();
  }
}

class EventsState extends State<Events> with SingleTickerProviderStateMixin{
  final List<Tab> tabs = <Tab>[
    new Tab(text:'Talks'),
    new Tab(text:'Workshops')
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
        tracksPressedListner: (){},
        profilePressedListner: (){Navigator.pushNamedAndRemoveUntil(context, '/profile',(Route<dynamic> route)=>false);},
      ),
      floatingActionButton: FloatingActionButton(
        child: devspaceTriangle(),
        backgroundColor: const Color(0xff107cfe),
        onPressed: (){triggerBottomModalSheet(
          context:context,
          eventHandler1: (){Navigator.pushNamedAndRemoveUntil(context, '/timeline',(Route<dynamic> route)=>false);},
          eventHandler2: (){Navigator.pushNamedAndRemoveUntil(context, '/codespace',(Route<dynamic> route)=>false);},
          eventHandler3: (){},
          asset1: 'lib/assets/itinerarybg.png',
          asset2: 'lib/assets/tri_cir_sq_bg.png',
          asset3: 'lib/assets/micbg.png', 
          selectedIndex: 3, 
        );},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _eventLayout(context,tabs,_tabController),
    );
  }
  Widget _eventLayout(context,List<Tab> tabs,controller){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/codespacebg.png'),
          fit: BoxFit.cover
        )
      ),
      child: Stack(
        children: <Widget>[
          TabBarView(
            controller: controller,
            children: tabs.map(
              (Tab tab){
               if(tab.text=='Talks'){
                 return _talksLayout(context);
               }
               else{
                 return _workshopLayout(context);
               }
              }
            ).toList()
          )
        ],
      ),
    );
  }

  Widget _workshopLayout(context){
    return ListView(
      children: <Widget>[
        _workshopItem(
          context:context,
          workshop: "Amazon Alexa",
          speaker: "Sohan Maheshwar",
          time:"13:45-16:45",
          date: "29th March",
          desc: "Rise Of Voice User Interface"
        ),
        _workshopItem(
          context:context,
          workshop: "Coding Blocks",
          speaker: "Prateek Narang",
          time:"17:00-20:00",
          date: "29th March",
          desc: "Workshop on Competitve Coding"
        ),
        _workshopItem(
          context:context,
          workshop: "IBM",
          speaker: "Lawrence Mohanraj",
          time:"13:30-16:30",
          date: "30th March",
          desc: "Workshop on thier Watson A.I. Platform"
        ),
      ],
    );
  }

  Widget _talksLayout(context){
    return ListView(
      children: <Widget>[
        _workshopItem(
          context:context,
          workshop: "IBM",
          speaker: "Lawrence Mohanraj",
          time:"11:30-12:30",
          date: "29th March",
          desc: "Talk on embracing innovation in the digital era"
        ),
        _workshopItem(
          context:context,
          workshop: "Digital Ocean",
          speaker: "Mohan Ram",
          time:"12:30-13:00",
          date: "29th March",
          desc: "Simplyfing Cloud: A session on Scaling"
        ),
        _workshopItem(
          context:context,
          workshop: "Mozilla",
          speaker: "Vishwaparasath K.S.",
          time:"10:00-11:00",
          date: "30th March",
          desc: "Web AR amd Mixed Reality on browsers."
        ),
      ],
    );
  }

  Widget _workshopItem({context,workshop,speaker,time,date,desc}){
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage('lib/assets/Card.png'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:14.0),
                  width: 200,
                  height: 50,
                  child: Column(
                    children: <Widget>[
                      Text(workshop,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(top:5.0),
                        child: Text(speaker,style: TextStyle(fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: const Color(0xff107cfe)),),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:22.0),
                  width: 100,
                  height: 50,
                  child: Column(
                    children: <Widget>[
                      Text(date,style: 
                      TextStyle(fontSize: 14,fontStyle: FontStyle.italic),),
                    ],
                  ),
                )             
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 35.0,top:10.0),
                  width: 150,
                  //color: Colors.white,
                  child: Text(desc,textAlign: TextAlign.left,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 35.0,top:10.0),
                  width: 100,
                  //color: Colors.white,
                  child: Text(time,textAlign: TextAlign.left,style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xff107cfe)
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}