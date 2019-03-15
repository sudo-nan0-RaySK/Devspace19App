import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceHolder.dart';
import 'package:devspace_app/widgets/screenwideButton.dart';
class AuthGreet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AuthGreetState();
  } 
}

class AuthGreetState extends State<AuthGreet>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          devspaceHolder(context,43.0,160.0),
          _loginButton(context),
          _registerButton(context)
        ],
      )
    );
  }
}


Widget _loginButton(context){
  return screenwideButton(
    context: context,
    onTapAction: (){},
    edgeTop: 530.0,
    edgeLeft: 25.0,
    btnText: 'Login',
    btnTextColor: const Color(0xffffffff),
    btnHeight: 45.0,
    btnWidth: 330.0,
    decorationObject: BoxDecoration(
      color: const Color(0xff107cfe),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
  );
}


Widget _registerButton(context){
  return screenwideButton(
    context: context,
    onTapAction: (){Navigator.of(context).pushReplacementNamed('/register');},
    edgeTop: 600.0,
    edgeLeft: 25.0,
    btnText: 'Signup',
    btnTextColor: const Color(0xff000000),
    btnHeight: 45.0,
    btnWidth: 330.0,
    decorationObject: BoxDecoration(
      color: const Color(0xffffffff),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
  );
}

