import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceHolder.dart';
import 'package:devspace_app/widgets/screenwideButton.dart';
import 'package:flutter/cupertino.dart';
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
      body: SingleChildScrollView(
              child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/mainScreenbg.png'),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Stack(
              children: <Widget>[
                devspaceHolder(context,20.0,160.0),
                _loginButton(context),
                _registerButton(context)
              ],
            ),
          ),
        ),
      )
    );
  }
}


Widget _loginButton(context){
  return screenwideButton(
    context: context,
    onTapAction: (){Navigator.pushNamedAndRemoveUntil(context, '/login',ModalRoute.withName('/'));},
    edgeTop: 530.0,
    edgeLeft: 0.0,
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
    onTapAction: (){Navigator.pushNamedAndRemoveUntil(context, '/register',ModalRoute.withName('/'));},
    edgeTop: 600.0,
    edgeLeft: 0.0,
    btnText: 'Signup',
    btnTextColor: const Color(0xff000000),
    btnHeight: 45.0,
    btnWidth: 330.0,
    decorationObject: BoxDecoration(
      color: const Color(0xfffafafa),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
  );
}

