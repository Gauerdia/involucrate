import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/components/calendar_popup_view.dart';
import 'package:involucrate/components/test_tab_header.dart';
import 'package:involucrate/model/discussion_list_data.dart';
import 'package:involucrate/model/engagement_list_darta.dart';
import 'package:involucrate/theme/theme_config.dart';
import 'package:involucrate/views/discussion/show_discussion_screen.dart';
import 'package:involucrate/views/discussion_feed/discussion_list_view.dart';
import 'package:involucrate/views/discussion_feed/engagement_list_view.dart';
import 'package:involucrate/views/engagement/show_engagement_screen.dart';
import 'package:involucrate/views/project_feed/filter_screen.dart';

class DiscussionFeedScreen extends StatefulWidget {
  const DiscussionFeedScreen({Key? key}) : super(key: key);

  @override
  _DiscussionFeedScreenState createState() => _DiscussionFeedScreenState();
}

class _DiscussionFeedScreenState extends State<DiscussionFeedScreen> with TickerProviderStateMixin {

  // Needed to animate the project-tiles we want to show
  late AnimationController animationController;

  // Neede for the nestedScrolling, which enables Sliver
  final ScrollController _scrollController = ScrollController();

  // The two reference lists
  List<DiscussionListData> exampleBasicDiscussionList = DiscussionListData
      .discussionListReal;//.discussionListRandom;
  List<DiscussionListData> examplePreferredDiscussionList = DiscussionListData
      .discussionListRealPreferred;//.discussionListPreferred;

  // The lists which will change depending on the user's input
  List<DiscussionListData> discussionListToShow = DiscussionListData
      .discussionListReal;//.discussionListRandom;

  // the ref list
  List<EngagementListData> exampleBasicEngagementList = EngagementListData.exampleRandomList;

  List<EngagementListData> examplePreferredEngagementList = EngagementListData.examplePreferredList;

  // the variable lists
  List<EngagementListData> engagementListToShow = EngagementListData.exampleRandomList;


  // Switches between discussions and engagements
  bool discussionOrEngagement = true;

  // Toggle-Variable for the "choose Feed"-field
  bool preferredDiscussionOrEngagement = false;

  // For the searchbar
  String searchBarValue = "";

  // Define text to change it later
  String random_what = "Random Discussions";
  String preferred_what = "Preferred Discussions";
  String choose_what = "Choose Discussions";


  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme
          .of(context)
          .dialogBackgroundColor,
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

  _buildMainColumn(BuildContext context,
      AnimationController animationController) {
    return Column(
      children: [
        Container(height: 40, color: Theme
            .of(context)
            .dialogBackgroundColor),
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
                  child: _buildDiscussionsListView(animationController),
                )
            )
        )
      ],
    );
  }

  Widget _buildDiscussionsListView(AnimationController animationController) {
    if (discussionOrEngagement) {
      List<DiscussionListData> discussionListToBuild = discussionListToShow;

      return ListView.builder(
          itemCount: discussionListToBuild.length,
          padding: const EdgeInsets.only(top: 8),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            int count = discussionListToBuild.length > 10
                ? 10
                : discussionListToBuild.length;
            final Animation<double> animation =
            Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: animationController,
                    curve: Interval(
                        (1 / count) * index,
                        1.0,
                        curve: Curves.fastOutSlowIn)));
            animationController.forward();
            return DiscussionListView(
              callback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        ShowDiscussionScreen(
                            discussionData: discussionListToShow[index]))
                );
              },
              animation: animation,
              animationController: animationController,
              discussionData: discussionListToBuild[index],
            );
          }
      );
    } else {
      List<EngagementListData> engagementListToBuild = engagementListToShow;

      return ListView.builder(
          itemCount: engagementListToBuild.length,
          padding: const EdgeInsets.only(top: 8),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            int count = engagementListToBuild.length > 10 ? 10 : engagementListToBuild.length;
            final Animation<double> animation =
            Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: animationController,
                    curve: Interval(
                        (1 / count) * index,
                        1.0,
                        curve: Curves.fastOutSlowIn)));
            animationController.forward();
            return EngagementListView(
              callback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        ShowEngagementScreen(
                            engagementData: engagementListToBuild[index]))
                );
              },
              animation: animation,
              animationController: animationController,
              engagementData: engagementListToBuild[index],
            );
          }
      );
    }
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
                        _togglePreferredDiscussionOrEngagement();
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
                            choose_what,
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            preferredDiscussionOrEngagement
                                ? preferred_what
                                : random_what,
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
                      _togglediscussionsOrEngagement();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'Discussions/Engagements',
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 14,
                                  color: Colors.grey.withOpacity(0.8)
                              )
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            discussionOrEngagement
                                ? "Discussions"
                                : "Engagement",
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
    String howManyDiscussions = discussionListToShow.length.toString() +
        " discussions found";

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
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      howManyDiscussions,
                      style: const TextStyle(
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
                            builder: (BuildContext context) => FilterScreen(),
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
      color: Theme
          .of(context)
          .dialogBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 8, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .primaryColor,
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

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (String txt) {
          searchBarValue = txt;
        setState(() {
          _filterGeneral();
          //_filterProjectsThroughSearchbar();
        });
      },
      style: const TextStyle(
        fontSize: 18,
      ),
      cursorColor: Theme
          .of(context)
          .primaryColor,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search for...',
      ),
    );
  }

  /// Building the search button next to the search bar
  Widget _buildSearchButton() {
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .colorScheme
            .secondary,
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
                color: Theme
                    .of(context)
                    .backgroundColor
            ),
          ),
        ),
      ),
    );
  }

  void showCalendarDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) =>
          CalendarPopupView(
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

  /// Toggle Functions

  void _togglediscussionsOrEngagement() {
    print("ToggleDiscussionOrEngagement");
    setState(() {
      if (discussionOrEngagement) {
        preferred_what = "Preferred Engagement";
        random_what = "Random Engagement";
        choose_what = "Choose Engagement";
      } else {
        preferred_what = "Preferred Discussion";
        random_what = "Random Discussion";
        choose_what = "Choose Discussion";
      }
      discussionOrEngagement = !discussionOrEngagement;
      _filterGeneral();
    });
  }

  void _togglePreferredDiscussionOrEngagement() {
    print("_togglePreferredDiscussion");
    setState(() {
      preferredDiscussionOrEngagement = !preferredDiscussionOrEngagement;
      _filterGeneral();
    });
  }

  /// Filter functions


  void _filterGeneral(){

    // Firstly, check which array we are operating on
    _filterGetDesiredFeed();

    if(searchBarValue != ""){
      _filterGetDesiredText();
    }
  }

  void _filterGetDesiredFeed(){

    // Firstly, we look for the discussion arrays
    if(discussionOrEngagement){
      if(preferredDiscussionOrEngagement){
        discussionListToShow = examplePreferredDiscussionList;
      }else{
        discussionListToShow = exampleBasicDiscussionList;
      }
    // Alternatively, we are looking for engagements
    }else{
      if(preferredDiscussionOrEngagement){
        engagementListToShow = examplePreferredEngagementList;
      }else{
        engagementListToShow = exampleBasicEngagementList;
      }
    }
  }

  void _filterGetDesiredText(){
    if(discussionOrEngagement){
      final filteredDiscussions = discussionListToShow.where(
              (discussion) =>
              discussion.title.toLowerCase().contains(searchBarValue))
          .toList();
      discussionListToShow = filteredDiscussions;
    }else{
      final filteredEngagements = engagementListToShow.where(
              (discussion) =>
              discussion.name.toLowerCase().contains(searchBarValue))
          .toList();
      engagementListToShow = filteredEngagements;
    }
  }


}
