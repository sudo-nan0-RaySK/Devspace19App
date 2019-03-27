import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/authGreet.dart';
import 'screens/register.dart';
import 'screens/timelineFlow.dart';
import 'screens/login.dart';
import 'screens/codespace.dart';
import 'screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/events.dart';

void main(List<String> args) {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_){
      runApp(DevspaceApp());
    });
}

class Devspace extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DevspaceApp();
  } 
}

class DevspaceApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DevspaceAppState();
  } 
}

class DevspaceAppState extends State<DevspaceApp>{
  String _email;
  dynamic home = AuthGreet();

  final devspaceTheme = ThemeData(
    accentColor: const Color(0xff000000),
    primaryColor: const Color(0xff107cfe),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff000000),
    canvasColor: Colors.transparent
  );

  Future<String> getEmail() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _email =  prefs.getString("email")??'email';
    print("email is ${ _email }");
    if(_email!='email'){
      setState(() {
        home =TimelineFlow();
      });
    }
    return prefs.getString("email")??'email';
  }

  @override
  void initState(){
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    print(_email);
    return MaterialApp(
      title: 'Devspace\'19',
      debugShowCheckedModeBanner:false,
      home: home,
      theme: devspaceTheme,
      routes: <String,WidgetBuilder>{
        '/timeline': (context)=>TimelineFlow(),
        '/login':(context)=>Login(),
        '/register':(context)=>Register(),
        '/codespace':(context)=>Codespace(tracks: false,),
        '/tracks':(context)=>Codespace(tracks: true,),
        '/profile':(context)=>Profile(),
        '/authGreet' : (context)=>AuthGreet(),
        '/events': (context)=>Events()
      },
    );
  }
}

