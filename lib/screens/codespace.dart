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

  TabController _controller = null;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {}

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
              eventHandler1: () {Navigator.pushReplacementNamed(context, '/timeline');},
              eventHandler2: () {},
              eventHandler3: () {},
              asset1: 'lib/assets/itinerary.png',
              asset2: 'lib/assets/tri_cir_sqr.png',
              asset3: 'lib/assets/mike.png',
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
              return Center(child: Text(tab.text),);
            }
          ).toList(),
        )
      ],
    ),
  );
}