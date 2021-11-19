import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/components/test_tab_header.dart';
import 'package:involucrate/model/engagement_list_darta.dart';
import 'package:involucrate/theme/theme_config.dart';

class ShowEngagementScreen extends StatefulWidget {
  const ShowEngagementScreen({
    Key? key,
    required this.engagementData
  }) : super(key: key);

  final EngagementListData? engagementData;

  @override
  _ShowEngagementScreenState createState() => _ShowEngagementScreenState();
}

class _ShowEngagementScreenState extends State<ShowEngagementScreen> {
  // Neede for the nestedScrolling, which enables Sliver
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Theme.of(context).dialogBackgroundColor,
        margin: const EdgeInsets.only(top: 0),
        child: _buildMainStack(context), //_mainColumn(),
      ),
    );
  }

  /// Structure

  Widget _buildMainStack(BuildContext context){
    print("CoWorking");
    return Theme(
        data: ThemeConfig.lightTheme,
        child: Container(
            child: Stack(
                children: [
                  _buildMainColumn(context)
                ]
            )
        )
    );
  }
  Widget _buildMainColumn(BuildContext context) {
    return Column(
      children: [
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
                                _buildTitleImage(widget.engagementData)
                              ],
                            );
                          },
                          childCount: 1
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: TestTabHeader(
                        _buildPersistantHeader(context),
                        widget.engagementData!.name.length
                      ),
                    ),
                  ];
                },
                body: _buildContentContainer()
            )
        ),
      ],
    );
  }

  /// Head of view

  Widget _buildTitleImage(EngagementListData? projectData){
    return AspectRatio(
      aspectRatio: 1.5,
      child: Image.asset(
          projectData!.imagePath,
          fit: BoxFit.fill),
    );
  }
  Widget _buildPersistantHeader(BuildContext context){

    return Container(
/*
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(3)
      ),


 */
      height: 600,
      child: Padding(
        padding: EdgeInsets.only(top:8),
        child: Text(widget.engagementData!.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 32
            )
        ),
      ),
    );
  }

  /// Main content

  Widget _buildContentContainer(){

    return Container(
        color: Theme
            .of(context)
            .backgroundColor,
        child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                _buildMission(),
                _buildDescription(),
                _buildMeetNGreetDate()
              ],
            )
        )
    );
  }

  Widget _buildMission(){
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 15),
      child: Column(
        children: [
          Text("Mission",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 26
              )
          ),
          SizedBox(height: 16,),
          _buildCloudyBackground(widget.engagementData!.mission)
        ],
      ),
    );
  }

  Widget _buildDescription(){
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 15),
      child: Column(
        children: [
          Text("Description",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 26
              )
          ),
          SizedBox(height: 16,),
          _buildCloudyBackground(widget.engagementData!.description)
        ],
      ),
    );
  }

  Widget _buildMeetNGreetDate(){
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 15),
      child: Column(
        children: [
          Text("Meet'n'Greet",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 26
              )
          ),
          SizedBox(height: 16,),
          _buildCloudyBackground(widget.engagementData!.meetNGreetDate)
        ],
      ),
    );
  }

  Widget _buildCloudyBackground(String textToDisplay){
    return Padding(
        padding: const EdgeInsets.only(
            left: 8, right: 8, top: 8, bottom: 16
        ),
        child: InkWell(
          splashColor: Colors.transparent,
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
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  child: _buildCategoryContentStack(textToDisplay)
              )
          ),
        )
    );
  }


  Widget _buildCategoryContentStack(String textToDisplay){
    return Stack(
      children: [
        Column(
          children: [
            _buildTextPart(textToDisplay)
          ],
        )
      ],
    );
  }

  Widget _buildTextPart(String textToDisplay){
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
                      left: 16, top: 16, bottom: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textToDisplay,
                          style: const TextStyle(
                              fontSize: 14
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }


  /*
  @override
  Widget build(BuildContext context) {

    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Theme.of(context).dialogBackgroundColor,
        margin: const EdgeInsets.only(top: 0),
        child: _buildMainStack(context), //_mainColumn(),
      ),
    );
  }


  Widget _buildMainStack(BuildContext context){
    return Theme(
        data: ThemeConfig.lightTheme,
        child: Container(
            child: Stack(
                children: [
                  _buildMainColumn(context)
                ]
            )
        )
    );
  }

  Widget _buildMainColumn(BuildContext context) {
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
                                _buildTitleImage(widget.engagementData)
                              ],
                            );
                          }, childCount: 1),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: TestTabHeader(
                        _buildPersistantHeader(context),
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
                    child: _buildContent()//_buildProjectsListView(animationController),
                )
            )
        )
      ],
    );
  }

  Widget _buildPersistantHeader(BuildContext context){
    return Container(
      height: 150,
      color: Theme.of(context).dialogBackgroundColor,
      child: Row(
        children: [
          Text(widget.engagementData!.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 32
              )
          )
        ],
      ),
    );
  }

  Widget _buildTitleImage(EngagementListData? discussionData){
    return AspectRatio(
      aspectRatio: 2,
      child: Image.asset(
          discussionData!.imagePath,
          fit: BoxFit.fill),
    );
  }

  Widget _buildContent(){
    return Container(
      child: Text("Something about the Engagemnet"),
    );
  }


 */
}

