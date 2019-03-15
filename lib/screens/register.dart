import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceHolder.dart';
import 'package:devspace_app/widgets/screenwideButton.dart';

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
final GlobalKey<FormFieldState> _passKey = GlobalKey<FormFieldState>();
String _email, _pass, _confPass;

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerLayout(context),
    );
  }
}

Widget _registerLayout(context) {
  return Column(
    children: <Widget>[
      devspaceHolder(context, 9.0, 100.0),
      _formContainer(context)
    ],
  );
}

Widget _formContainer(context) {
  return Form(
    key: _formKey,
    child: Column(
      children: <Widget>[
        sizedContainer(context,_emaiLField),
        sizedContainer(context,_createPasswordField),
        sizedContainer(context,_confirmPasswordField),
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
          labelStyle: TextStyle(color: const Color(0xffffffff)),
          labelText: "EMAIL",
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xffffffff)))),
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
          labelStyle: TextStyle(color: const Color(0xffffffff)),
          labelText: "CREATE PASSWORD",
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xffffffff)))),
      validator: (str) =>
          str.length <= 7 ? "Password must be 8 characters long!" : null,
      onSaved: (str) => _pass = str,
      obscureText: true,
    ),
  );
}

Widget _confirmPasswordField(context) {
  return Theme(
    data: ThemeData(
      primaryColor: const Color(0xff107cfe),
      accentColor: const Color(0xffffffff),
    ),
    child: TextFormField(
      autocorrect: false,
      style: TextStyle(color: const Color(0xffffffff)),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: const Color(0xffffffff)),
        labelText: "CONFIRM PASSWORD",
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: const Color(0xffffffff))),
      ),
      validator: (str) => !(str == _passKey.currentState.value)
          ? "Password doesn't match!"
          : null,
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
    btnText: 'Signup',
    btnTextColor: const Color(0xff107cfe),
    btnHeight: 45.0,
    btnWidth: 330.0,
    decorationObject: BoxDecoration(
        color: const Color(0xffffffff),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
  );
}

Widget sizedContainer(context,child){
  return Container(
    child: child(context),
    width: 300,
  );
}

void onPressed(context) {
  var formKey = _formKey.currentState;
  if (formKey.validate()) {
    print('Login Called !');
  }
}
