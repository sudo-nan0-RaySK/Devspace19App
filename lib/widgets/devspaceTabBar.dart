import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:devspace_app/widgets/devspaceAppBar.dart';

Widget devspaceTabBar({context,eventHandler,enabled,tabController,tabs}){
  return AppBar(
    backgroundColor: const Color(0xff111111),
    title:devspaceHeader(context),
    actions: <Widget>[
      logoutBtn(context, eventHandler, enabled)
    ],
    bottom: _bubbleTabBar(context,tabController,tabs),
  );
}

Widget _bubbleTabBar(context,tabController,tabs){
  return TabBar(
    isScrollable: true,
    labelColor: Colors.white,
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: _bubbleIndicator(),
  );
}

BubbleTabIndicator _bubbleIndicator(){
  return BubbleTabIndicator(
    indicatorHeight: 25.0,
    indicatorColor: const Color(0xff107cfe),
    tabBarIndicatorSize: TabBarIndicatorSize.tab
  );
}