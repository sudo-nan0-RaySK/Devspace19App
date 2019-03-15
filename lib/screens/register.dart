import 'package:flutter/material.dart';
import 'authGreet.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerLayout(context),
    );
  }  
}

Widget _registerLayout(context){
  return Column(
    children: <Widget>[
      devspaceHolder(context,100.0)
    ],
  );
}

