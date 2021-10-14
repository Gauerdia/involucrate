import 'package:flutter/cupertino.dart';

class ShowProjectScreen extends StatefulWidget {
  const ShowProjectScreen({Key? key}) : super(key: key);

  @override
  _ShowProjectScreenState createState() => _ShowProjectScreenState();
}

class _ShowProjectScreenState extends State<ShowProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Text("ShowProjectScreen"),
    );
  }
}
