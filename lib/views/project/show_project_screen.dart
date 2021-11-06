import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:involucrate/components/test_tab_header.dart';
import 'package:involucrate/model/project_list_data.dart';
import 'package:involucrate/theme/theme_config.dart';
import 'package:involucrate/views/comments/show_comments_screen.dart';
import 'package:involucrate/views/profile/comment_tile.dart';

class ShowProjectScreen extends StatefulWidget {
  const ShowProjectScreen({
    Key? key,
    required this.projectData,
    required this.showCaseCreateProject
  }) : super(key: key);

  final ProjectListData? projectData;
  final bool showCaseCreateProject;

  @override
  _ShowProjectScreenState createState() => _ShowProjectScreenState();
}

class _ShowProjectScreenState extends State<ShowProjectScreen> {

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
                                _buildTitleImage(widget.projectData)
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
                          widget.projectData!.title.length
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

  Widget _buildTitleImage(ProjectListData? projectData){
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
        child: Text(widget.projectData!.title,
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
                          title: Text("General comments",
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
          Text(widget.projectData!.categories[index],
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 26
              )
          ),
          _buildCloudyBackground(widget.projectData!.categories_content[index])
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

    return widget.showCaseCreateProject
    ? Container(
      child: Text("No comments yet"),
    )
    : Container(
      child: Column(
        children: [
          for(var item in publicComments) CommentTile(name: item['name'], imageUrl: item['imageUrl'], content: item['content'], date: item['date']),
        ],
      ),
    );
  }

  /// Helper functions

  List<Widget> _createCategoryItemsWidgets(){

    List<Widget> widgetsToDisplayList = [];

    for(var i=0;i<widget.projectData!.categories.length; i++){
      Widget headLineToDisplay = Text(widget.projectData!.categories[i],
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 26
          )
      );
      Widget contentToDisplay = _buildCloudyBackground(widget.projectData!.categories_content[i]);

      Widget columnToDisplay = Column(
        children: [
          headLineToDisplay,
          contentToDisplay,
          Row(
            children: [
              GestureDetector(
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowCommentsScreen(title: widget.projectData!.categories[i],)),
                  );

                  },
                child: Icon(FeatherIcons.messageSquare),
              )
            ],
              mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      );

      widgetsToDisplayList.add(columnToDisplay);

    }

    return widgetsToDisplayList;
  }
  Widget _buildListViewOfCategoryItems() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.projectData!.categories.length,
        padding: const EdgeInsets.only(top: 8),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return _buildCategoryContent(index);
        }
    );
  }

  void togglePublicCommentsOpen(){
    setState(() {
      publicCommentsOpen = !publicCommentsOpen;
    });
  }

  void _buildCommentDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Comments"),
            content: Container(
              child: Text("efwef"),
            ),
            actions: [
              ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("Back"))
            ],
          );
        });
  }

}
