import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceAppBar.dart';
import 'package:devspace_app/widgets/notchedBar.dart';
import 'package:devspace_app/widgets/circularBottomSheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:devspace_app/widgets/screenwideButton.dart';


class Tokens extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TokensState();
  }

}

class TokensState extends State<Tokens>{

  String _data="" , _name="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: devspaceAppBar(context, () {}, false, false),
      bottomNavigationBar: notchedBar(
        tracksPressedListner: () {},
        profilePressedListner: () {},
      ),
      body: Center(child: tokensLayout(context)),
      floatingActionButton: FloatingActionButton(
        child: devspaceTriangle(),
        backgroundColor: const Color(0xff107cfe),
        onPressed: () {
          triggerBottomModalSheet(
            context: context,
            eventHandler1: () {Navigator.pushNamedAndRemoveUntil(context, '/timeline',(Route<dynamic> route)=>false);},
            eventHandler2: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/codespace', (Route<dynamic> route) => false);
            },
            eventHandler3: () {Navigator.pushNamedAndRemoveUntil(context, '/events',(Route<dynamic> route)=>false);},
            asset1: 'lib/assets/itinerarybg.png',
            asset2: 'lib/assets/tri_cir_sq_bg.png',
            asset3: 'lib/assets/micbg.png',
            selectedIndex: 1,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void initState(){
    super.initState();
    getEmail();
    getName();
  }

  Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _data = prefs.getString("email") ?? 'email';
    });
    return prefs.getString("email") ?? 'email';
  }

  Future<String> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString("name") ?? 'name';
    });
    return prefs.getString("name") ?? 'name';
  }

  Widget devspaceTriangle(){
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/Triangle_white.png'),
          fit: BoxFit.contain
        )
      ),
    );
  }
  
  Widget tokensLayout(context){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:28.0),
          child: Container(
            height: 50,
            width: 300,
            child: Text("Food Coupons",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: const Color(0xfffafafa),
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height:50,
            width:150,
            child: Text("Hey "+_name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: const Color(0xff107cfe),
                  fontWeight: FontWeight.bold,
                ),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height:100,
            width:200,
            child: Text('Places to eat near you',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: const Color(0xfffafafa),
                  fontWeight: FontWeight.bold,
                ),
            )
          ),
        )
      ],
    );
  }
}



