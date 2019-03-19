import 'package:flutter/material.dart';

Widget formFieldIcon(context,height,width,resource){
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(resource),
        fit: BoxFit.fitWidth,
      )
    ),
  );
}