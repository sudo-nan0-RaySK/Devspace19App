import 'package:flutter/material.dart';


void triggerBottomModalSheet({context,eventHandler1,eventHandler2,eventHandler3,asset1,asset2,asset3,selectedIndex}){
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc){
      return _circularContainer(bc,
      roundedButtons(
            context: context,
            eventHandler1: eventHandler1,
            eventHandler2: eventHandler2,
            eventHandler3: eventHandler3,
            asset1: asset1,
            asset2: asset2,
            asset3: asset3,
            selectedIndex : selectedIndex,
          )
      );
    }
  );
}

Widget _circularContainer(context,child){
  return Container(
    color: const Color(0xFFFFFF),
    width: 400,
    child: ClipPath(
      clipper: CircularClipper(),
      child: Container(
        height: 300,
        child: child,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xff111111),
        ),
      ),
    ),
  );
}

class CircularClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0.0, size.height-150);
    var middleControlPoint = Offset(size.width/2, (size.height-260)/2);
    var endPoint = Offset(size.width,size.height-150);
    path.quadraticBezierTo(middleControlPoint.dx, middleControlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Widget roundedButtons({context,eventHandler1,eventHandler2,eventHandler3,asset1,asset2,asset3,int selectedIndex}){
  var index1Color = Colors.white;
  var index2Color = Colors.white;
  var index3Color = Colors.white;
  switch (selectedIndex) {
    case 1:
      index1Color = const Color(0xff107cfe);
      break;
    case 2:
      index2Color = const Color(0xff107cfe);
      break;
    case 3:
      index3Color = const Color(0xff107cfe);
      break;
    default:
  }
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // children: <Widget>[
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.only(top:69.0,left:5.0),
      //         child: roundedButtonMaterial(context,eventHandler1,asset1),
      //       ),
      //     ],
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.only(top:8.0),
      //     child: Text('Itinerary',style: TextStyle(color: index1Color),),
      //   ),
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.only(left:45.0,top:10.0),
      //         child: roundedButtonMaterial(context,eventHandler2,asset2),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left:185.0,top:10.0),
      //         child: roundedButtonMaterial(context,eventHandler3,asset3),
      //       )
      //     ],
      //   ),
      //   Row(
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.only(left:35.0,top:8.0),
      //         child: Text('Codespace',style: TextStyle(color: index2Color),),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left:180.0,top:1.0),
      //         child: Text('Events',style: TextStyle(color: index3Color),),
      //       )
      //     ],
      //   ),
      // ],
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  roundedButtonMaterial(context,eventHandler1,asset1),
                  Text('Itinerary',style: TextStyle(color: index1Color),),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                roundedButtonMaterial(context,eventHandler2,asset2),
                Text('Codespace',style: TextStyle(color: index2Color),),
              ],
            ),
            Container(width: 175,),
            Column(
              children: <Widget>[
                roundedButtonMaterial(context,eventHandler3,asset3),
                Text('Events',style: TextStyle(color: index3Color),),
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget roundedButtonMaterial(context,eventHandler,asset){
  return GestureDetector(
    onTap: eventHandler,
    child: Container(
      width:55,
      height:55,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.fitHeight,
        )
      ),
    )
  );
}