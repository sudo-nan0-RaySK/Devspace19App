import 'package:flutter/material.dart';

Widget devspaceAppBar(context,eventHandler,enabled,autoImplyLeading){
  return AppBar(
    automaticallyImplyLeading: autoImplyLeading,
    backgroundColor: const Color(0xff111111),
    title: devspaceHeader(context),
    actions: <Widget>[
      logoutBtn(context, eventHandler,enabled)
    ],
  );
}

Widget devspaceHeader(context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        width: 110,
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

Widget logoutBtn(context,eventHandler,enabled){
  if(!enabled){
    return Container();
  }
  return Padding(
    padding: const EdgeInsets.only(top:12.0,left:10.0,right:15.0,bottom:15.0),
    child: Container(
      width: 100,
      height: MediaQuery.of(context).size.height/2,
      child: logoutFlatButton(context, eventHandler),
    ),
  );
}

Widget logoutFlatButton(context,eventHandler){
  return FlatButton(
    color: const Color(0xff0261a6),
    textColor: const Color(0xfffafafa),
    child: Text('Logout'),
    onPressed: eventHandler,
  );
}
