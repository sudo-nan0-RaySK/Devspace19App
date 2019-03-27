import 'package:flutter/material.dart';
import 'package:devspace_app/widgets/devspaceAppBar.dart';
import 'package:devspace_app/widgets/notchedBar.dart';
import 'package:devspace_app/widgets/circularBottomSheet.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  String _data = "", _name = "";


  @override
  void initState(){
    super.initState();
    getEmail();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: devspaceAppBar(context, () {}, false, false),
      bottomNavigationBar: notchedBar(
        tracksPressedListner: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/tracks', (Route<dynamic> route) => false);
        },
        profilePressedListner: () {},
      ),
      body: profileLayout(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        backgroundColor: const Color(0xff107cfe),
        onPressed: () {
          triggerBottomModalSheet(
            context: context,
            eventHandler1: () {},
            eventHandler2: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/codespace', (Route<dynamic> route) => false);
            },
            eventHandler3: () {},
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

  Widget profileLayout(context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: heading(context: context, text: 'Hello!'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: headingSmall(context: context, text: _name),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: qrCodeContainer(context),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Here is your food coupon for Codespace\'19',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13, color: const Color(0xfffafafa))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 28.9),
            child: faqsContainer(context),
          )
        ],
      ),
    );
  }

  Widget heading({context, text}) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 21,
          color: const Color(0xff107cfe),
        ),
      ),
    );
  }

  Widget headingSmall({context, text}) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, color: const Color(0xfffafafa)),
      ),
    );
  }

  Widget qrCodeContainer(context) {
    print("data is "+_data);
    return QrImage(
      size: 150,
      backgroundColor: Colors.white,
      data: _data,
    );
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

  Widget faqsContainer(context) {
    return Container(
      width: 500,
      height: 700,
      child: Column(
        children: <Widget>[
          Text('FAQ\'s:',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 13, color: const Color(0xff107cfe))),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: faqItem(
                context: context,
                question:
                    'Go to Settings > Wi-Fi , and make sure \n Wi-Fi is turned on. Then tap Other? \n',
                answer:
                    'Enter the exact name of the network , then \n tap Security.'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: faqItem(
                context: context,
                question:
                    'Go to Settings > Wi-Fi , and make sure \n Wi-Fi is turned on. Then tap Other? \n',
                answer:
                    'Enter the exact name of the network , then \n tap Security.'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: faqItem(
                context: context,
                question:
                    'Go to Settings > Wi-Fi , and make sure \n Wi-Fi is turned on. Then tap Other? \n',
                answer:
                    'Enter the exact name of the network , then \n tap Security.'),
          ),
        ],
      ),
    );
  }

  Widget faqItem({context, question, answer}) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 1.0),
              child: Container(
                  padding: EdgeInsets.only(bottom: 29.0),
                  child: Text('Q.',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 13, color: const Color(0xff107cfe)))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 1.0),
              child: Text(question,
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 13, color: const Color(0xfffafafa))),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 3.0),
              child: Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text('->.',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 13, color: const Color(0xff107cfe)))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 3.0),
              child: Text(answer,
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 13, color: const Color(0xfffafafa))),
            ),
          ],
        )
      ],
    );
  }
}
