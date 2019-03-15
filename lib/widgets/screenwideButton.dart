import 'package:flutter/material.dart';

Widget screenwideButton({context,onTapAction,edgeTop,edgeLeft,btnText,btnTextColor,btnHeight,btnWidth,decorationObject}){
  return GestureDetector(
    onTap: onTapAction,
    child: Container(
      margin: EdgeInsets.only(top: edgeTop, left: edgeLeft),
      child: Center(
        child: Text(btnText,style: TextStyle(color: btnTextColor)),
      ),
      height: btnHeight,
      width: btnWidth,
      decoration: decorationObject,
    ),
  );
}