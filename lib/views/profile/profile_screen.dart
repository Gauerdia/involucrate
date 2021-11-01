import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/model/profile_data.dart';
import 'package:involucrate/model/project_list_data.dart';
import 'package:involucrate/views/co_working_space/co_working_space_screen.dart';
import 'package:involucrate/views/profile/small_project_list_view.dart';
import 'package:involucrate/views/project/options_screen.dart';
import 'package:involucrate/views/project/show_project_screen.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {

  late Size screenSize;
  List<ProfileData> profileList = ProfileData.profileDataList;

  List<ProjectListData> projectList = ProjectListData.projectListPreferences;


  // Needed to animate the project-tiles we want to show
  late final animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: _buildMainListView(),
    );
  }

  Widget _buildMainListView(){
    return SafeArea(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            _buildUpperPart(),
            _buildLowerPart(),
            _buildBottomTiles()
          ],
        ),
      ),
    );
  }

  Widget _buildUpperPart(){
    return SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                //_buildCoverImage(),
                _buildCoverImageGradientOpacity(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height / 6.4),
                      _buildProfileImage(),
                      _buildFullName(),
                      _buildShortSum(),
                      _buildBioInfo(),
                    ],
                  ),
                )
              ],
            )
          ],
        )
    );
  }

  Widget _buildLowerPart(){

    List<Widget> currentProjectWidgets = _buildCurrentProjectsListView();
    List<Widget> pastProjectWidgets = _buildPastProjectsListView();

    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8,top: 8,bottom: 8),
                child: Text("Projects: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top:12,bottom: 12),
            child: Text("Current Projects: ",
              style: TextStyle(
                  fontSize: 25
              ),
            ),
          ),
          for(var widget in currentProjectWidgets) widget,
          Container(
            padding: EdgeInsets.only(top:12,bottom: 12),
            child: Text("Past Projects: ",
              style: TextStyle(
                  fontSize: 25
              ),
            ),
          ),
          for(var widget in pastProjectWidgets) widget,
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8,top: 8,bottom: 16),
                child: Text("Discussions: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          Text("No discussions yet"),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8,top: 16,bottom: 16),
                child: Text("Settings: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCoverImageGradientOpacity(){
    return Center(
      child: ShaderMask(
        shaderCallback: (rectangle){
          return const LinearGradient(
              colors: [Colors.white, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
              .createShader(
                Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
        },
        blendMode: BlendMode.dstIn,
        child: const Image(fit: BoxFit.cover,
                     image: AssetImage('assets/images/abstract_wallpaper_1.jpg')
        ),
      ),
    );
  }

  Widget _buildProfileImage(){
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/profile1.jpg'),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 2.0
          )
        ),
      ),
    );
  }

  // The text of the name below the profile picture
  Widget _buildFullName() {
      TextStyle _nameTextStyle = const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
      );
      return Container(
          padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
          child: Text(
            profileList[0].name + " " + profileList[0].surname,
            style: _nameTextStyle,
          ));
  }

  Widget _buildShortSum() {

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          profileList[0].shortSum,
          style: const TextStyle(
            fontFamily: 'Spectral',
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic
          ),
        ),
      );
  }

  Widget _buildBioInfo(){
    return Container(
      width: screenSize.width,
      padding: const EdgeInsets.only(left: 30,right: 20, top: 30),
      child: Center(
        child: Column(
          children: [
            _buildInfoBubble()
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBubble(){
    return InkWell(
      splashColor: Colors.transparent,
      onTap: (){},
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius:  const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(4,4),
              blurRadius: 16,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: _buildInfoBubbleContainer(),
        )
      ),
    );
  }

  Widget _buildInfoBubbleContainer(){
    return Stack(
      children:[
        Column(
          children:[
            Container(
              height: 150,
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
                            _buildInfoBubbleContent()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        )
      ],
    );
  }

  Widget _buildInfoBubbleContent(){
    return Column(
      children: [
        Row(
          children: [
            const Text("Location: ",
                style: TextStyle(
                  fontFamily: 'Spectral',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                )
            ),
            Text(profileList[0].location,
                style: const TextStyle(
                  fontFamily: 'Spectral',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                )
            )
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            const Text("Occupation: ",
                style: TextStyle(
                  fontFamily: 'Spectral',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                )
            ),
            Text(profileList[0].profession,
                style: const TextStyle(
                  fontFamily: 'Spectral',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                )
            )
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            const Text("Engagement: ",
                style: TextStyle(
                  fontFamily: 'Spectral',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                )
            ),
            Text(profileList[0].engagement,
                style: const TextStyle(
                  fontFamily: 'Spectral',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                )
            )
          ],
        ),
      ],
    );
  }

  List<Widget> _buildCurrentProjectsListView() {

    List<Widget> widgets = [];

    int count = projectList.length > 10? 10 : projectList.length;
    for(var i=0; i<1; i++){
      final Animation<double> animation =
      Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: animationController,
              curve: Interval(
                  (1 / count) * i,
                  1.0,
                  curve: Curves.fastOutSlowIn)));
      animationController.forward();
      widgets.add(
          SmallProjectListView(
              callback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        CoWorkingSpaceScreen(projectData: projectList[i]))
                );
              },
            animation: animation,
            animationController: animationController,
            projectData: projectList[i]
          )
      );
    }

    return widgets;
  }

  List<Widget> _buildPastProjectsListView() {

    List<Widget> widgets = [];

    int count = projectList.length > 10? 10 : projectList.length;
    for(var i=1; i<projectList.length; i++){
      final Animation<double> animation =
      Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: animationController,
              curve: Interval(
                  (1 / count) * i,
                  1.0,
                  curve: Curves.fastOutSlowIn)));
      animationController.forward();
      widgets.add(
          SmallProjectListView(
              callback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        CoWorkingSpaceScreen(projectData: projectList[i]))
                );
              },
              animation: animation,
              animationController: animationController,
              projectData: projectList[i]
          )
      );
    }

    return widgets;
  }

  Widget _buildBottomTiles(){
    return Column(
      children: [
        _buildOptionsTile(),
        _buildLogOutTile(),
        SizedBox(height: 20,)
      ],
    );
  }

  Widget _buildOptionsTile(){
    return GestureDetector(
      child: _buildTileBubble("Options"),
      onTap: (){
        print("onPress Options");
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => OptionsScreen(),
              fullscreenDialog: true),
        );

      },
    );

  }

  Widget _buildLogOutTile(){
    return _buildTileBubble("Log Out");
  }

  Widget _buildTileBubble(String title){

    return Container(
      width: screenSize.width,
      padding: const EdgeInsets.only(left: 10,right: 10, top: 20),
      child: Center(
        child: Column(
          children: [
            InkWell(
            splashColor: Colors.transparent,
            onTap: (){print("Clicked: " + title);},
            child: Container(
                decoration: BoxDecoration(
                  borderRadius:  const BorderRadius.all(Radius.circular(16.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(4,4),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: _buildTileBubbleContainer(title),
                )
            ),
          )
          ],
        ),
      ),
    );
  }

  Widget _buildTileBubbleContainer(String title){
    return Stack(
      children:[
        Column(
          children:[
            Container(
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
                          child: _buildTileBubbleContent(title)
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTileBubbleContent(String title){
    return Column(
      children: [
        const SizedBox(height: 15,),
        Row(
          children: [
            Icon(
              FeatherIcons.settings,
              size: 22,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: const TextStyle(
              fontFamily: 'Spectral',
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w300,
              )
            ),
          ],
        ),
        const SizedBox(height: 15,)
      ],
    );
  }

}
