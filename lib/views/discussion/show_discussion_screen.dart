import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/components/test_tab_header.dart';
import 'package:involucrate/model/discussion_list_data.dart';
import 'package:involucrate/theme/theme_config.dart';
import 'package:involucrate/views/profile/comment_tile.dart';

class ShowDiscussionScreen extends StatefulWidget {
  const ShowDiscussionScreen({
    Key? key,
    required this.discussionData
  }) : super(key: key);

  final DiscussionListData? discussionData;

  @override
  _ShowDiscussionScreenState createState() => _ShowDiscussionScreenState();
}

class _ShowDiscussionScreenState extends State<ShowDiscussionScreen> {

  // Needed for the nestedScrolling, which enables Sliver
  final ScrollController _scrollController = ScrollController();

  int _page = 0;

  bool publicCommentsOpen = false;
  bool privateCommentsOpen = false;

  List drawerItems = [
    {"icon": Icons.add,"name": "Feed",},
    {"icon": Icons.delete, "name": "Your Feed",},
    {"icon": Icons.delete, "name": "test1",},
    {"icon": Icons.delete, "name": "test2",},
    {"icon": Icons.delete, "name": "test3",},
  ];

  List publicComments = [
    {"name": "Peter Zwegat", "imageUrl":"assets/images/profile1.jpg", "content":"I could make a cake!", "date": 1627137747159},
    {"name": "Lorenz Fischbaum", "imageUrl":"assets/images/profile2.jpg", "content":"I may contribute some chairs, if that helps", "date": 1627137943116},
    {"name": "Gertrude Meisacker", "imageUrl":"assets/images/profile_girl_1.jpg", "content":"I don't know what exactly I can do, but I am in love with the idea !", "date": 1627337747159},
  ];
  List privateComments = [
    {"name": "Arno Dübel", "imageUrl":"assets/images/profile2.jpg", "content":"I would take care of the organisation. I already did similar things in my last occupation.","date": 1627137747159},
    {"name": "Beate Rausch", "imageUrl":"assets/images/profile_girl_1.jpg", "content":"I contacted some friends, we could carry the heavy stuff.", "date": 1627137949116},
    {"name": "Hermut Vogelsang", "imageUrl":"assets/images/profile1.jpg", "content":"I need someone to drive to the wholesale with me. We still lack a few very important items.", "date": 1627139143116},
  ];

  List<Widget> contentToDisplayList = [];


  @override
  Widget build(BuildContext context) {

    contentToDisplayList = _createCategoryItemsWidgets();

    return Scaffold(
      body: Container(
        color: Theme.of(context).dialogBackgroundColor,
        margin: const EdgeInsets.only(top: 0),
        child: _buildMainStack(context), //_mainColumn(),
      ),
      drawer: _buildDrawer(),
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
                                _buildTitleImage(widget.discussionData)
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
                          widget.discussionData!.title.length
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

  Widget _buildTitleImage(DiscussionListData? projectData){
    return AspectRatio(
      aspectRatio: 1.5,
      child: Image.asset(
          projectData!.imagePath,
          fit: BoxFit.fill),
    );
  }
  Widget _buildPersistantHeader(BuildContext context){
    return Container(
      height: 500,
      color: Theme.of(context).dialogBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(top:8),
        child: Text(widget.discussionData!.title,
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
                SizedBox(height: 16,),
                for(var widget in contentToDisplayList) widget,

                /// First Comment Section
                GestureDetector(
                  onTap: (){togglePublicCommentsOpen();},
                  child: Card(
                    elevation: 4.0,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Public comments",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26
                              )
                          ),
                          trailing: Icon(publicCommentsOpen ?
                          Icons.arrow_drop_down_sharp
                              : Icons.arrow_left_sharp),
                        ),
                      ],
                    ),
                  ),
                ),
                publicCommentsOpen?
                _buildPublicCommentsExample()
                    : Container(),
              ],
            )
        )
    );
  }

  Widget _buildCategoryContent(int index){
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 15),
      child: Column(
        children: [
          Text(widget.discussionData!.categories[index],
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 26
              )
          ),
          _buildCloudyBackground(widget.discussionData!.categories_content[index])
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

  Widget _buildPublicCommentsExample(){
    return Container(
      child: Column(
        children: [
          for(var item in publicComments) CommentTile(name: item['name'], imageUrl: item['imageUrl'], content: item['content'], date: item['date'])
        ],
      ),
    );
  }

  Widget _buildPrivateCommentsExample(){
    return Container(
      child: Column(
        children: [
          for(var item in privateComments) CommentTile(name: item['name'], imageUrl: item['imageUrl'], content: item['content'], date: item['date'])

        ],
      ),
    );
  }


  /// Drawer Components
  Drawer _buildDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: const Center(
              child: Text("Header Area"),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: drawerItems.length,
              itemBuilder: (BuildContext context, int index){
                Map item = drawerItems[index];
                return _buildDrawerListTile(item,index);
              })
        ],
      ),
    );
  }
  Widget _buildDrawerListTile(Map item, int index){
    return ListTile(
      leading: Icon(
          item['icon'],
          color: _page == index
              ?Theme.of(context).primaryColorLight
              : Theme.of(context).primaryColorDark
      ),
      title: Text(
          item["name"],
          style: TextStyle(
              color: _page == index
                  ?Theme.of(context).primaryColorLight
                  :Theme.of(context).primaryColorDark
          )
      ),
      onTap: (){
        /*
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowProjectScreen())
        );
         */
      },
    );
  }

  /// Helper functions

  List<Widget> _createCategoryItemsWidgets(){

    List<Widget> widgetsToDisplayList = [];

    for(var i=0;i<widget.discussionData!.categories.length; i++){
      Widget headLineToDisplay = Text(widget.discussionData!.categories[i],
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 26
          )
      );
      Widget contentToDisplay = _buildCloudyBackground(widget.discussionData!.categories_content[i]);

      widgetsToDisplayList.add(headLineToDisplay);
      widgetsToDisplayList.add(contentToDisplay);
    }

    return widgetsToDisplayList;
  }

  void togglePublicCommentsOpen(){
    setState(() {
      publicCommentsOpen = !publicCommentsOpen;
    });
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
                                _buildTitleImage(widget.discussionData)
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
          Text(widget.discussionData!.title,
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

  Widget _buildTitleImage(DiscussionListData? discussionData){
    return AspectRatio(
      aspectRatio: 2,
      child: Image.asset(
          discussionData!.imagePath,
          fit: BoxFit.fill),
    );
  }

  Widget _buildContent(){

    return ListView.builder(
        itemCount: widget.discussionData!.categories.length,
        padding: const EdgeInsets.only(top: 8),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return _buildCategoryAndContent(index);
        }
    );
  }

  Widget _buildCategoryAndContent(int index){
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 15),
      child: Column(
        children: [
          Text(widget.discussionData!.categories[index],
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 26
              )
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(widget.discussionData!.categories_content[index],
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16
                )),
          ),
        ],
      ),
    );
  }


   */
}
