import 'package:flutter/material.dart';
import 'login.dart';

void main(List<String> args) {
  runApp(mainApp);
}

class DevspaceApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return LoginWidget();
  }
}

/*
 * Material Routing Widget
 */
var mainApp =MaterialApp(
  home: DevspaceApp(),
  theme: devspaceTheme,
  routes: <String,WidgetBuilder>{
    //TODO Material Routing
  },
);

/*
 * Theme Data
 */
var devspaceTheme = ThemeData(
  accentColor: const Color(0xff000000),
  primaryColor: const Color(0xff107cfe),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xff000000)
);