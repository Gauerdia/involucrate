import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:involucrate/model/discussion_list_data.dart';
import 'package:involucrate/model/project_list_data.dart';

class ProjectListView extends StatelessWidget {
  const ProjectListView({
    Key? key,
  required this.animationController,
  required this.animation,
  required this.callback,
    required this.projectData
  }) : super(key: key);

  final VoidCallback? callback;
  final ProjectListData? projectData;
  final AnimationController? animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return _buildAnimation(context);
  }

  _buildAnimation(BuildContext context){
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child){
          return FadeTransition(
              opacity: animation,
              child: Transform(
                transform:  Matrix4.translationValues(
                    0.0, 50*(1.0 - animation.value), 0.0),
                child: _buildInkWell(context),
              )
          );
        }
    );
  }

  _buildInkWell(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(
        left: 24, right: 24, top: 8, bottom: 16
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            borderRadius:  const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: projectData!.state == 0 ? Color(0xff9f8259).withOpacity(0.6)
                       : Color(0xff9f5959).withOpacity(0.6),//Colors.grey.withOpacity(0.6),
                offset: const Offset(4,4),
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: _buildStack(context),
          )
        ),
      )
    );
  }

  Widget _buildStack(BuildContext context){
    return Stack(
      children: [
        Column(
          children: [
            _buildImage(),
            _buildLowerTextPart(context)
          ],
        )
      ],
    );
  }

  Widget _buildImage(){
    return AspectRatio(
      aspectRatio: 2,
      child: Image.asset(
          projectData!.imagePath,
          fit: BoxFit.fill),
    );
  }

  Widget _buildLowerTextPart(BuildContext context){
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16, top: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextFirstRow(),
                      _buildTextSecondRow(context),
                      _buildTextThirdRow(context)
                    ],
                  ),
                ),
              ),
            ),
            _buildTextPrice()
          ],
        )
    );
  }

  Widget _buildTextFirstRow(){
    return Text(projectData!.title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22
        )
    );
  }

  Widget _buildTextSecondRow(BuildContext context){
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.center,
      mainAxisAlignment:
      MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.mapMarkerAlt,
          size: 12,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          projectData!.location,
          style: TextStyle(
              fontSize: 14,
              color: Colors.grey
                  .withOpacity(0.8)),
        ),
      ],
    );
  }

  Widget _buildTextThirdRow(BuildContext context){
    return Padding(
      padding:
      const EdgeInsets.only(top: 4),
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.solidObjectGroup,
            size: 12,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            projectData!.organiser,
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey
                    .withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  _buildTextPrice(){
    return Padding(
      padding: const EdgeInsets.only(
          right: 16, top: 8),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        crossAxisAlignment:
        CrossAxisAlignment.end,
        children: <Widget>[
          const Text(
            'Every sunday',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            'starting 10/21',
            style: TextStyle(
                fontSize: 14,
                color:
                Colors.grey.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }


}
