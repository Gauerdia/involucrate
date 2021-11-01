import 'dart:ui';

import 'package:flutter/material.dart';




class PlanningReinforcementDialog extends StatefulWidget {
  PlanningReinforcementDialog({
    Key? key,
    required this.callbackToggleInPlanning,
    required this.callbackToggleReinforcement,
    required this.isCheckedStillInPlanning,
    required this.isCheckedLookingForReinforcement
  }) : super(key: key);

  VoidCallback? callbackToggleInPlanning;
  VoidCallback? callbackToggleReinforcement;

  bool isCheckedStillInPlanning = false;
  bool isCheckedLookingForReinforcement = false;


  @override
  _PlanningReinforcementDialogState createState() => _PlanningReinforcementDialogState();
}

class _PlanningReinforcementDialogState extends State<PlanningReinforcementDialog> {

  late double deviceWidth;
  late double deviceHeight;
  late double dialogHeight;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size viewsSize = MediaQuery.of(context).size;

    deviceWidth = orientation == Orientation.portrait
        ? viewsSize.width
        : viewsSize.height;
    deviceHeight = orientation == Orientation.portrait
        ? viewsSize.height
        : viewsSize.width;
    dialogHeight = deviceHeight * (0.50);

    return MediaQuery(
      data: MediaQueryData(),
      child: GestureDetector(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 0.5,
            sigmaY: 0.5,
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: deviceWidth * 0.9,
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: _buildCotent(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCotent(){
    return Container(
      height: 100,
      child: Column(
        children: [
          Row(
            children: [

              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  onTap: () {
                    setState(() {
                      widget.callbackToggleInPlanning;
                      widget.isCheckedStillInPlanning = !widget.isCheckedStillInPlanning;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          widget.isCheckedStillInPlanning
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: widget.isCheckedStillInPlanning
                              ? Colors.orangeAccent
                              : Colors.grey.withOpacity(0.6),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "text",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ],
      ),
      ]
      )
    );
  }

}
