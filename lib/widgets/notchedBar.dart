import 'package:flutter/material.dart';

Widget notchedBar({tracksPressedListner,profilePressedListner}){
  return BottomAppBar(
    color: const Color(0xff111111),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.track_changes),
          onPressed: tracksPressedListner,
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: profilePressedListner,
        )
      ],
    ) ,
    shape: CircularNotchedRectangle(),
  );
}