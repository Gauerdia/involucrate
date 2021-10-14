import 'package:flutter/cupertino.dart';

class CoWorkingSpaceScreen extends StatefulWidget {
  const CoWorkingSpaceScreen({Key? key}) : super(key: key);

  @override
  _CoWorkingSpaceScreenState createState() => _CoWorkingSpaceScreenState();
}

class _CoWorkingSpaceScreenState extends State<CoWorkingSpaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Text("CoWorkingSpaceScreen"),
    );
  }
}
