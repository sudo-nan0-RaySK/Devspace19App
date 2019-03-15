import 'package:flutter/material.dart';

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
          devspaceHolder(context,160.0),
          _loginButton(context),
          _registerButton(context)
        ],
      )
    );
  }
}

Widget devspaceHolder(context,marginTop){
  return Container(
    height: 200,
    width: 300,
    margin: EdgeInsets.only(left: 43.0, top: marginTop),
    decoration: BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        image: ExactAssetImage('lib/assets/devspace-landing.png')
      )
    ),
  );
}

Widget _loginButton(context){
  return GestureDetector(
    onTap: (){},
    child: Container(
      margin: EdgeInsets.only(top: 530.0, left: 25.0),
      child: Center(
        child: Text('Login',style: TextStyle(color: const Color(0xffffffff))),
      ),
      height: 45,
      width: 330,
      decoration: BoxDecoration(
        color: const Color(0xff107cfe),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
    ),
  );
}

Widget _registerButton(context){
  return GestureDetector(
    onTap: (){ Navigator.of(context).pushReplacementNamed('/register');},
    child: Container(
      margin: EdgeInsets.only(top: 600.0, left: 25.0),
      child: Center(
        child: Text('Signup',style: TextStyle(color: const Color(0xff000000))),
      ),
      height: 45,
      width: 330,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
    ),
  );
}

