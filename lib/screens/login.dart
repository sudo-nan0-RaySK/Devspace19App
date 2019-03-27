import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceHolder.dart';
import 'package:devspace_app/widgets/screenwideButton.dart';
import 'package:devspace_app/widgets/formFieldIcon.dart';
import 'package:devspace_app/widgets/devspaceAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:devspace_app/models/response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
final GlobalKey<FormFieldState> _passKey = GlobalKey<FormFieldState>();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
String _email, _pass, _confPass, _btnText = "Login";

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {

  void onPressed(context) {
    var formKey = _formKey.currentState;
    if (formKey.validate()) {
      print('Login Called !');
      _formKey.currentState.save();
      setState(() {
        _btnText = "Loading...";
      });
      final url = 'https://devspace.csivit.com/app/login';
      http.post(url, body: {"email": _email, "password": _pass}).then((res) {
        print(res.body);
        final jsonResponse = json.decode(res.body);
        Response resObj = Response.fromJson(jsonResponse);
        setState(() {
          _btnText = "Login";
        });
        if(resObj.success){
          setEmail(_email).then((onValue){
            if(onValue){
              setName(resObj.name).then((onFinalValue){
                if(onFinalValue){
                  Navigator.pushNamedAndRemoveUntil(context, '/timeline', (Route<dynamic> route) => false);
                }
              });
            }
          });
        }
        else{
          final snackBar = SnackBar(content: Text(resObj.reason));
          _scaffoldKey.currentState.showSnackBar(snackBar);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      appBar: devspaceAppBar(context, () {}, false, true),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/mainScreenbg.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              _registerLayout(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerLayout(context) {
    return Column(
      children: <Widget>[
        devspaceHolder(context, 6.0, 40.0),
        _formContainer(context)
      ],
    );
  }

  Widget _formContainer(context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: formFieldIcon(
                    context, 30.0, 25.0, 'lib/assets/emailIcon.png'),
              ),
              spacer(0.0, 10.0),
              sizedContainer(context, _emaiLField),
            ],
          ),
          spacer(50.0, 0.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: formFieldIcon(
                    context, 30.0, 20.0, 'lib/assets/PASSWORDIcon.png'),
              ),
              spacer(0.0, 10.0),
              sizedContainer(context, _createPasswordField),
            ],
          ),
          spacer(10.0, 0.0),
          _registerButton(context)
        ],
      ),
    );
  }

  Widget _emaiLField(context) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xff107cfe),
        accentColor: const Color(0xffffffff),
      ),
      child: TextFormField(
        autocorrect: false,
        style: TextStyle(color: const Color(0xffffffff)),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5.0),
            labelStyle: TextStyle(color: const Color(0xffffffff)),
            labelText: "EMAIL",
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: const Color(0xffffffff),
            ))),
        validator: (str) => !str.contains('@') ? "Invalid EMail ID!" : null,
        onSaved: (str) => _email = str,
      ),
    );
  }

  Widget _createPasswordField(context) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xff107cfe),
        accentColor: const Color(0xffffffff),
      ),
      child: TextFormField(
        key: _passKey,
        style: TextStyle(color: const Color(0xffffffff)),
        autocorrect: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5.0),
            labelStyle: TextStyle(color: const Color(0xffffffff)),
            labelText: "PASSWORD",
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: const Color(0xffffffff)))),
        validator: (str) =>
            str.length <= 7 ? "Password must be 8 characters long!" : null,
        onSaved: (str) => _pass = str,
        obscureText: true,
      ),
    );
  }

  Widget _registerButton(context) {
    return screenwideButton(
      context: context,
      onTapAction: () {
        onPressed(context);
      },
      edgeTop: 100.0,
      edgeLeft: 15.0,
      btnText: _btnText,
      btnTextColor: const Color(0xff107cfe),
      btnHeight: 45.0,
      btnWidth: 330.0,
      decorationObject: BoxDecoration(
          color: const Color(0xfffafafa),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }

  Widget sizedContainer(context, child) {
    return Container(
      child: child(context),
      width: 300,
    );
  }

  Widget spacer(height, width) {
    return Container(
      height: height,
      width: width,
    );
  }

  Future<bool> setEmail(String email) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("email", email);
  }

  Future<bool> setName(String name) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("name", name);
  }
}
