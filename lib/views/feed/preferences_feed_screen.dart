import 'package:flutter/cupertino.dart';

class PreferencesFeedScreen extends StatefulWidget {
  const PreferencesFeedScreen({Key? key}) : super(key: key);

  @override
  _PreferencesFeedScreenState createState() => _PreferencesFeedScreenState();
}

class _PreferencesFeedScreenState extends State<PreferencesFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Text("Pref-Feed"),
    );
  }
}
