import 'package:flutter/material.dart';

Widget devspaceHolder(context,marginLeft,marginTop){
  return Container(
    height: 200,
    width: 300,
    margin: EdgeInsets.only(left: marginLeft, top: marginTop),
    decoration: BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        image: ExactAssetImage('lib/assets/devspace-landing.png')
      )
    ),
  );
}