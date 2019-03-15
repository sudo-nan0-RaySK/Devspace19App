import 'package:flutter/material.dart';

class CurvyBottomBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CurvyBottomBarState();
  }
}

class CurvyBottomBarState extends State<CurvyBottomBar>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _clippedBottomContainer(context),
            ],
          ),
        );
  }
}

Widget _clippedBottomContainer(context){
  return ClipPath(
    clipper: CurvyClipper(),
    child: _bottomBarContainer(context),
  );
}

Widget _bottomBarContainer(context){
  return Container(
    height: 60,
    decoration: BoxDecoration(
      color: const Color(0xff484848),
      borderRadius: BorderRadius.all(Radius.circular(20.0))
    ),
  );
}

class CurvyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo((size.width/2)-60, 0.0);
    var middleControlPoint = Offset((size.width/2),size.height+40);
    var endPoint = Offset((size.width/2)+60,0.0);
    path.quadraticBezierTo(middleControlPoint.dx, middleControlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
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