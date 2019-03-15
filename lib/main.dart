import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/circularBottomSheet.dart';
import 'widgets/curvyBottomBar.dart';
import 'screens/authGreet.dart';
import 'screens/register.dart';


void main(List<String> args) {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_){
      runApp(DevspaceApp());
    });
}

class DevspaceApp extends StatelessWidget{

  var devspaceTheme = ThemeData(
    accentColor: const Color(0xff000000),
    primaryColor: const Color(0xff107cfe),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff000000),
    canvasColor: Colors.transparent
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devspace\'19',
      home: AuthGreet(),
      theme: devspaceTheme,
      routes: <String,WidgetBuilder>{
      },
    );
  }
}

