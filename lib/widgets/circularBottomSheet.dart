import 'package:flutter/material.dart';

class CircularBottomSheet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CircularBottomSheetState();
  }
}

class CircularBottomSheetState extends State<CircularBottomSheet>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Devspace\'19')),
      floatingActionButton: _floatingActionButton(context, _triggerBottomModalSheet),
    );
  }
}

void _triggerBottomModalSheet(context){
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc){
      return _circularContainer(bc);
    }
  );
}

Widget _circularContainer(context){
  return Container(
    color: const Color(0xff000000),
    width: 400,
    child: ClipPath(
      clipper: CircularClipper(),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xff107cfe),
        ),
      ),
    ),
  );
}

Widget _floatingActionButton(context,onPressedEvent){
  return FloatingActionButton(
    onPressed: (){ onPressedEvent(context);},
    backgroundColor: const Color(0xff107cfe),
    child: Icon(Icons.add)
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
    // TODO: implement shouldReclip
    return false;
  }
}