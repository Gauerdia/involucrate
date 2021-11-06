import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/components/calendar_popup_view.dart';
import 'package:involucrate/components/test_tab_header.dart';
import 'package:involucrate/model/project_list_data.dart';
import 'package:involucrate/theme/theme_config.dart';
import 'package:involucrate/views/co_working_space/co_working_space_screen.dart';
import 'package:involucrate/views/project_feed/filter_screen.dart';
import 'package:involucrate/views/project_feed/project_list_view.dart';
import 'package:involucrate/views/project/show_project_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {

  // Needed to animate the project-tiles we want to show
  late AnimationController animationController;

  List<ProjectListData> randomProjectList = ProjectListData.projectListRandom;
  List<ProjectListData> preferredProjectList = ProjectListData.projectListPreferences;
  List<ProjectListData> ownProjectList = ProjectListData.projectListOwnProjects;

  List<ProjectListData> projectListToShow = ProjectListData.projectListRandom;

  // Needed for the nestedScrolling, which enables Sliver
  final ScrollController _scrollController = ScrollController();

  // Toggle-Variables to change the "desired State"-field
  // 2 means all, 0 means still in planning, 1 means looking for reinforcement
  int desiredState = 2;

  // Toggle-Variable for the "choose Feed"-field
  // 0 means random, 1 means preferred, 2 means own feed
  int desiredFeed = 0;
  //bool preferredFeed = false;

  // For the searchbar
  String searchBarValue = "";


  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dialogBackgroundColor,
      margin: const EdgeInsets.only(top: 0),
      child: _buildMainStack(animationController), //_mainColumn(),
    );
  }

  _buildMainStack(AnimationController animationController) {

    return Theme(
      data: ThemeConfig.lightTheme,
      child: Container(
        child: Stack(
            children: [
              // InkWell enables ripple animation effects when tapped
              InkWell(
              splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: _buildMainColumn(context, animationController),
              )
            ],
        ),
      ),
    );
  }

  _buildMainColumn(BuildContext context, AnimationController animationController) {
    return Column(
        children: [
          Container(height: 40, color: Theme.of(context).dialogBackgroundColor),
          Expanded(
              child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (BuildContext context,
                      bool innerBoxIsScrolled) {
                    return [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Column(
                                children: [
                                  getSearchBarUI(),
                                  getTimeDateUI(),
                                ],
                              );
                            }, childCount: 1),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        floating: true,
                        delegate: TestTabHeader(
                          _getFilterBarUI(context),
                          0
                        ),
                      ),
                    ];
                  },
                  body: Container(
                    // bg-color of the part below the part with the search bar,
                    // filter and calendar
                    color: Theme
                        .of(context)
                        .backgroundColor,
                    child: _buildProjectsListView(animationController),
                  )
              )
          )
        ],
    );
  }

  Widget _buildProjectsListView(AnimationController animationController) {

    List<ProjectListData> projectListToBuild = projectListToShow;

    return ListView.builder(
        itemCount: projectListToBuild.length,
        padding: const EdgeInsets.only(top: 8),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          int count = projectListToBuild.length > 10? 10 : projectListToBuild.length;
          final Animation<double> animation =
          Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: animationController,
                  curve: Interval(
                      (1 / count) * index,
                      1.0,
                      curve: Curves.fastOutSlowIn)));
          animationController.forward();
          return ProjectListView(
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)
                  => desiredFeed == 2
                      ? CoWorkingSpaceScreen(
                          projectData: projectListToBuild[index]
                        )
                      : ShowProjectScreen(
                          projectData: projectListToBuild[index],
                          showCaseCreateProject: false
                        )
                  )
                );
              },
              animation: animation,
              animationController: animationController,
              projectData: projectListToBuild[index],
            );
        }
    );
  }

  /// The Row containing the calendar-Widget and the filter on the right side
  Widget getTimeDateUI() {


    /// Left side of filters
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  // bg specifically for the calendar button
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      setState(() {
                        _toggleDesiredFeed();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Choose Feed',
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            desiredFeed == 0
                              ? "Random Feed"
                              : desiredFeed == 1
                                ? "Preferred Feed"
                                : desiredFeed == 2
                                  ? "Own Feed"
                                  : "Error",
                            style: const TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          /// The line between the two widgets
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),


          /// Right side of filters
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      _toggleDesiredState();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Desired State',
                            style:TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 14,
                                color: Colors.grey.withOpacity(0.8)
                            )
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            desiredState == 2
                            ? "All"
                            : desiredState == 1
                            ? "Still being planned"
                            : desiredState == 0
                            ? "Looking for support"
                            : "Error",
                            style: const TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Below the search bar there is bar to filter the results. The design is being handled in this Widget.
  Widget _getFilterBarUI(BuildContext context) {

    String howManyProjectsText = projectListToShow.length.toString() + ' projects found';

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .dialogBackgroundColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(0, -2),
                    blurRadius: 8.0),
              ],
            ),
          ),
        ),
        Container(
          color: Theme
              .of(context)
              .backgroundColor,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      howManyProjectsText,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());

                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => const FilterScreen(),
                          fullscreenDialog: true),
                    );

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: const <Widget>[
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.sort,
                                color: Colors.orangeAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }

  /// The whole Row-Container of the search bar and it's background
  Widget getSearchBarUI() {
    return Container(
      color: Theme.of(context).dialogBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 8, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(38.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 8.0),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 4, bottom: 4),
                    child: _buildSearchBar(),
                  ),
                ),
              ),
            ),
            _buildSearchButton()
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(){
    return TextField(
      onChanged: (String txt) {
        searchBarValue = txt;
        setState(() {
          _filterProjectsGeneral();
          //_filterProjectsThroughSearchbar();
        });
      },
      style: const TextStyle(
        fontSize: 18,
      ),
      cursorColor: Theme.of(context).primaryColor,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search for...',
      ),
    );
  }

  /// Building the search button next to the search bar
  Widget _buildSearchButton(){
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(38.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(32.0),
          ),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.search,
                size: 20,
                color: Theme.of(context).backgroundColor
            ),
          ),
        ),
      ),
    );
  }

  void showCalendarDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }


  /// Toggle Variables


  void _toggleDesiredFeed(){

    // Toggle the state of the feed
    desiredFeed += 1;
    if(desiredFeed >= 3){
      desiredFeed = 0;
    }

    setState(() {
      _filterProjectsGeneral();
    });

  }

  /// desiredState == 0: All, desiredState == 1: Still in Planning, desiredState == 2: Looking for Reinforcement
  void _toggleDesiredState(){

    desiredState += 1;
    if(desiredState >= 3){
      desiredState = 0;
    }

    setState(() {
      _filterProjectsGeneral();
    });

  }

  /// Filter functions
  void _filterProjectsGeneral(){

      // Firstly, check which array we are operating on
      _filterGetDesiredFeed();

      // Secondly, we filter through the states.
      _filterGetDesiredState();

      if(searchBarValue != ""){
        _filterGetDesiredText();
      }
  }

  void _filterGetDesiredFeed(){
    switch(desiredFeed){
      case 0: {
        projectListToShow = randomProjectList;
      } break;
      case 1: {
        projectListToShow = preferredProjectList;
      } break;
      case 2: {
        projectListToShow = ownProjectList;
      } break;
      default: {
        projectListToShow = randomProjectList;
      } break;
    }
  }

  void _filterGetDesiredState(){
    // 2 represents the wish for all elements
    if(desiredState != 2){
      final filteredProjects = projectListToShow.where(
              (project) => project.state == desiredState)
          .toList();
      projectListToShow = filteredProjects;
    }
  }

  void _filterGetDesiredText(){
    final filteredProjects = projectListToShow.where(
            (project) =>
            project.title.toLowerCase().contains(searchBarValue))
        .toList();
    projectListToShow = filteredProjects;
  }
}

