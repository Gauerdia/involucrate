import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/views/test/routing_1.dart';

class Routing2Screen extends StatefulWidget {
  const Routing2Screen({Key? key}) : super(key: key);

  @override
  _Routing2ScreenState createState() => _Routing2ScreenState();
}

class _Routing2ScreenState extends State<Routing2Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text("Test"),
        onPressed: (){routeToTest1(context);},
      ),
    );
  }

  void routeToTest1(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Routing1Screen()),
    );
  }
}
