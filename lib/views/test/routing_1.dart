import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/views/test/routing_2.dart';

class Routing1Screen extends StatefulWidget {
  const Routing1Screen({Key? key}) : super(key: key);

  @override
  _Routing1ScreenState createState() => _Routing1ScreenState();
}

class _Routing1ScreenState extends State<Routing1Screen> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: TextButton(
        child: Scaffold(
          appBar: AppBar(title: Text("fefe")),
          body: Text("e3ffef")
        ),//_buildTest(),//Text("Test"),
        onPressed: (){routeToTest2(context);},
      ),
    );

  }

  void routeToTest2(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Routing2Screen()),
    );
  }

  Widget _buildTest(){
    return Container(
      width: 100,
      height: 50,
      color: Colors.green,
      child: Column(
        children: [
          Text("frgr"),
          Text("ferf"),
          Text("fefe")
        ],
      )
    );
  }

}
