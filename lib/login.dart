import "package:flutter/material.dart";

class LoginWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginWidget>{
  String emailID = "";

  void onLogInClicked(){
    //TODO : onLogInClicked
  }

  @override
  Widget build(BuildContext context) {

    var emailIdField = Container(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[900],
          hintText: 'Email ID',
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0))
            )
        ),
        onChanged: (text){
          emailID=text;
        },
      ),
    );

    var logInButton = Container(
      child: RaisedButton(
        child: Text('Log In'),
        onPressed:(){onLogInClicked();},
        color: Theme.of(context).primaryColor,
        shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      width: 285.0,
      height: 40.0,
    );

    var formContainer = Container(
      margin: const EdgeInsets.only(left:10.0,right:10.0,top:430.0),
      width: 320.0,
      height: 200.0,
      child: Column(
        children: <Widget>[
          emailIdField,
          logInButton
        ],
      )
    );

    var mainContainer = new Scaffold(
      body: Center(
        child: formContainer
      )
    );
    return mainContainer;
  }
}


