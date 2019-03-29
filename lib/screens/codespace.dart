import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceTabBar.dart';
import 'package:devspace_app/widgets/circularBottomSheet.dart';
import 'package:devspace_app/widgets/notchedBar.dart';

class Codespace extends StatefulWidget {
  final bool tracks;
  Codespace({Key key, this.tracks}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return CodespaceState(tracks: tracks);
  }
}

class CodespaceState extends State<Codespace> with SingleTickerProviderStateMixin {

  final bool tracks;

  CodespaceState({Key key, this.tracks }):super();

  List<Tab> _tabs = <Tab>[
    Tab(
      text: 'CODESPACE',
    ),
    Tab(
      text: 'TRACKS',
    ),
    Tab(text: 'TECH SUPPORT'),
  ];

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _tabs.length);
    if(tracks){
      _controller.animateTo(1);
    }
  }

  @override
  void dispose() {
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
          eventHandler: () {},
          enabled: true,
          tabController: _controller,
          tabs: _tabs,
          autoImplyLeading: false),
      bottomNavigationBar: notchedBar(
        tracksPressedListner: () {Navigator.pushNamedAndRemoveUntil(context, '/tokens',(Route<dynamic> route)=>false);},
        profilePressedListner: () {Navigator.pushNamed(context, '/profile');},
      ),
      floatingActionButton: FloatingActionButton(
        child: devspaceTriangle(),
        backgroundColor: const Color(0xff107cfe),
        onPressed: () {
          triggerBottomModalSheet(
              context: context,
              eventHandler1: () {Navigator.pushNamedAndRemoveUntil(context, '/timeline',(Route<dynamic> route)=>false);},
              eventHandler2: () {_controller.animateTo(0);},
              eventHandler3: () {Navigator.pushNamedAndRemoveUntil(context, '/events',(Route<dynamic> route)=>false);},
              asset1: 'lib/assets/itinerarybg.png',
              asset2: 'lib/assets/tri_cir_sq_bg.png',
              asset3: 'lib/assets/micbg.png',
              selectedIndex: 2
              );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _codeSpaceLayout(
        context: context,
        controller: _controller,
        tabs: _tabs,
      ),
    );
  }
}

Widget _codeSpaceLayout({context,List<Tab> tabs,controller}){
  return SingleChildScrollView(
      child: Container(
      height: 900,
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
                if(tab.text=='CODESPACE'){
                  return codespaceTab(context);
                }
                else if (tab.text=='TECH SUPPORT'){
                  return techSupportTab(context);
                }
                else{
                  return tracksTab(context);
                }
              }
            ).toList(),
          )
        ],
      ),
    ),
  );
}

Widget codespaceTab(context){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:28.0),
            child: Text(
              "CODESPACE",
              style: TextStyle(
                color: const Color(0xff107cfe),
                fontSize: 25.0,
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
            child: Text(
              "A national level hackathon aimed at bringing",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
              "India’s most fastforward thinkers, innovators and",
              textAlign: TextAlign.center,
            ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
              "Implementera,for the progress of technology",
              textAlign: TextAlign.center,
            ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
              "and literacy. 24 Hours dedicated to drive the",
              textAlign: TextAlign.center,
            ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
              "nation further into digital revolution.",
              textAlign: TextAlign.center,
            ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:28.0,bottom: 24.0),
            child: Text(
              "WHAT YOU WIN",
              style: TextStyle(
                color: const Color(0xff107cfe),
                fontSize: 19.0,
              ),
            ),
          )
        ],
      ),
      prizetable(context),
      Container(
        height: 100,
        width: 100,
      )
    ],
  );
}

Widget prizetable(context){
  return Expanded(
    child: Table(
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:58.0),
              child: Text(
                "PRIZE 1 :",
                textAlign: TextAlign.right,
                style: TextStyle(color: const Color(0xff107cfe),fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Text(
                "30k Cash Prize Sketch licenses, Creative Tim Licenses, Wolfram Licenses, Taskade Licenses, Hackerearth Tshirts, JetBrains Tshirts, Stickers and goodies",
              ),
            ),
          ]
        ),
        TableRow(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:58.0,top: 8.0),
              child: Text(
                "PRIZE 2 :",
                textAlign: TextAlign.right,
                style: TextStyle(color: const Color(0xff107cfe),fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20.0,top: 8.0),
              child: Text(
                "20k Cash Prize,Creative Tim Licenses,Wolfram Licenses,Taskade Licenses,Hackerearth Tshirts,JetBrains Tshirts,Creative Tim Licenses,Devspace Tshirts,Stickers and goodies",
              ),
            ),
          ]
        ),
        TableRow(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:58.0,top: 8.0),
              child: Text(
                "PRIZE 3 :",
                textAlign: TextAlign.right,
                style: TextStyle(color: const Color(0xff107cfe),fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20.0,top: 8.0),
              child: Text(
                "10k Cash Prize,Creative Tim Licenses,Wolfram Licenses,Taskade Licenses,Hackerearth TshirtsJetBrains Tshirts,Devspace Tshirts,Stickers and goodies,",
              ),
            ),
          ]
        ),
        TableRow(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:58.0,top: 8.0),
              child: Text(
                "Best Alexa Skill Implentation :",
                textAlign: TextAlign.right,
                style: TextStyle(color: const Color(0xff107cfe),fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20.0,top: 8.0),
              child: Text(
                "Amazon Echo Dot,Alexa Tshirts,Devspace Tshirts,Alexa Schwags,Creative Tim Licenses,Wolfram Licenses,Taskade Licenses,Stickers and goodies",
              ),
            ),
          ]
        )
      ],
    ),
  );
}

Widget techSupportTab(context){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:28.0),
            child: Text(
              "Technical Support",
              style: TextStyle(
                color: const Color(0xff107cfe),
                fontSize: 25.0,
              ),
            ),
          )
        ],
      ),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0,12.0,8.0,8.0),
          child: Container(
            child: Text(
              "Contact our technical team for any kind of technical assistence",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xffffffff),
                  fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Palash Golecha",
          github: "git/palashgo",
          image: "lib/assets/Circle_Palash.png"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Pradyun Gedam",
          github: "git/pradyunsg",
          image: "lib/assets/Circle_PradyunGedam.png"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Mayank Agarwal",
          github: "git/mayankagarwal09",
          image: "lib/assets/Circle_Mayank.png"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Tarush Nagpal",
          github: "git/CallMeTarush",
          image: "lib/assets/CircleTarush.png"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Saksham Sethi",
          github: "git/sudo-nan0-RaySK",
          image: "lib/assets/CircleSaksham.png"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Namit Nathwani",
          github: "git/namsnath",
          image: "lib/assets/Circle_NamitNathwani.png"
        ),
      )
    ],
  );
}

Widget techSupportListItem({context,name,github,image}){
  return Container(
    child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
                )
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(24.0,8.0,8.0,8.0),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xff107cfe),
                      fontSize: 18
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(24.0,8.0,8.0,8.0),
                  child: Text(
                    github,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: const Color(0xffffffff),
                      fontSize: 13
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    ),
  );
}

Widget tracksTab(context){
  return ListView(
    children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:28.0),
            child: Text(
              "Technical Tracks",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xff107cfe),
                fontSize: 27.0,
              ),
            ),
          ),
          tracksItem(
            context: context,
            image: 'lib/assets/Alexa.png',
            heading: 'Alexa Skill Building',
            description : 'This is so cool, Alexa come for  \n Devspace.'
          ),
          tracksItem(
            context: context,
            image: 'lib/assets/Education.png',
            heading: 'Education Technology',
            description : 'Learning how to learn. \n Can you bridge digital divide into \neducation.'
          ),tracksItem(
            context: context,
            image: 'lib/assets/Defence.png',
            heading: 'Defence and Surveillance',
            description : 'I see you , I know what you had for \n dinner. Were the Cup-Noodles and \n Pizzas filling enough'
          ),
          tracksItem(
            context: context,
            image: 'lib/assets/Algos.png',
            heading: 'Algorithmic Optimisations',
            description : 'Got Data Structures? \n Codespace can be the perfect \naddition to your grade!'
          ),
          tracksItem(
            context: context,
            image: 'lib/assets/Space.png',
            heading: 'Space Tech',
            description : 'Sky is the limit ? \n Not with us!'
          ),
          spacer()
        ],
  );
}

Widget tracksItem({context,image,heading,description}){
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain
              )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text(
            heading,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xff107cfe),
              fontSize: 21.0
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xffffffff),
              fontSize: 17.0
            ),
          ),
        ),
      ],
    ),
  );
}

Widget spacer(){
  return Container(
    width: 50,
    height: 250,
  );
}