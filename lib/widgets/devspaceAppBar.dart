import 'package:flutter/material.dart';

Widget devspaceAppBar(context,eventHandler,enabled,autoImplyLeading){
  return AppBar(
    automaticallyImplyLeading: autoImplyLeading,
    backgroundColor: const Color(0xff111111),
    title: devspaceHeader(context,50.0),
  );
}

Widget devspaceHeader(context,leftPadding){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left:leftPadding,top: 1.0),
        width: 160,
        height: 55,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/devspace-landing.png'),
            fit: BoxFit.contain,
          )
        ),
      ),
    ],
  );
}


