import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceTabBar.dart';
import 'package:devspace_app/widgets/circularBottomSheet.dart';
import 'package:devspace_app/widgets/notchedBar.dart';

class Codespace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CodespaceState();
  }
}

class CodespaceState extends State<Codespace>
    with SingleTickerProviderStateMixin {
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
  }

  @override
  void dispose() {
    super.dispose();
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
        tracksPressedListner: () {},
        profilePressedListner: () {},
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        backgroundColor: const Color(0xff107cfe),
        onPressed: () {
          triggerBottomModalSheet(
              context: context,
              eventHandler1: () {Navigator.pushNamedAndRemoveUntil(context, '/timeline',(Route<dynamic> route)=>false);},
              eventHandler2: () {},
              eventHandler3: () {},
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
                if(tab.text=='CODESPACE'){
                  return codespaceTab(context);
                }
                else if (tab.text=='TECH SUPPORT'){
                  return techSupportTab(context);
                }
                else{
                  return Center(child: Text(tab.text),);
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
      prizetable(context)
    ],
  );
}

Widget prizetable(context){
  return Table(
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
              "Cash prize 35k, goodies, T-shirts, licenses of various softwares like Sketch, Invision,and much more",
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
              "Cash prize 35k, goodies, T-shirts, licenses of various softwares like Sketch, Invision,and much more",
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
              "Cash prize 35k, goodies, T-shirts, licenses of various softwares like Sketch, Invision,and much more",
            ),
          ),
        ]
      )
    ],
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
          github: "git/pgolecha",
          image: "loda"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Pradyun Gedam",
          github: "git/pradyunsg",
          image: "loda"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Mayank Aggarwaal",
          github: "git/mayankaggarwal",
          image: "loda"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Tarush Nagpal",
          github: "git/CallMeTarush",
          image: "loda"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Saksham Sethi",
          github: "git/sudo-nan0-RaySK",
          image: "loda"
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(68.0,18.0,8.0,8.0),
        child: techSupportListItem(
          context:context,
          name:"Namit Nathwani",
          github: "git/namsnath",
          image: "loda"
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
                  image: AssetImage('lib/assets/tri_cir_sq_bg.png'),
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