import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:involucrate/components/test_tab_header.dart';
import 'package:involucrate/model/project_list_data.dart';
import 'package:involucrate/theme/theme_config.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:involucrate/views/comments/show_comments_screen.dart';
import 'package:involucrate/views/profile/comment_tile.dart';

class CoWorkingSpaceScreen extends StatefulWidget {
  CoWorkingSpaceScreen({
    Key? key,
    required this.projectData
  }) : super(key: key);

  ProjectListData projectData;

  @override
  _CoWorkingSpaceScreenState createState() => _CoWorkingSpaceScreenState();
}

class _CoWorkingSpaceScreenState extends State<CoWorkingSpaceScreen> {

  // Needed for the nestedScrolling, which enables Sliver
  final ScrollController _scrollController = ScrollController();

  int _page = 0;

  bool publicCommentsOpen = false;
  bool privateCommentsOpen = false;

  List drawerItems = [
    {"icon":Icons.apartment,"name":"General"},
    {"icon": Icons.account_circle_outlined,"name": "Show members",},
    {"icon": Icons.account_tree_outlined, "name": "Rights management",},
    {"icon": Icons.calendar_today_outlined, "name": "Internal calendar",},
    {"icon": Icons.group_outlined, "name": "Internal discussions",},
    {"icon": Icons.settings, "name": "Document settings",},
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

  List<Widget> customContentToAdd = [];

  late Size screenSize;


  @override
  Widget build(BuildContext context) {

    contentToDisplayList = _createCategoryItemsWidgets();
    print("build: " + contentToDisplayList.toString());
    screenSize = MediaQuery.of(context).size;

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
                        0
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
        child: Text(widget.projectData.title,
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
                  SizedBox(height: 38,),
                  for(var widget in contentToDisplayList) widget,

                  GestureDetector(
                    child: Container(
                      width: screenSize.width/7,
                      height: 50,
                      child: const Icon(
                        FeatherIcons.plusCircle,
                        color: Colors.orangeAccent,),
                    ),
                    onTap:() {_buildAddCustomCategoryDialog();},
                  ),

                  /// First Comment Section
                  GestureDetector(
                    onTap: (){togglePublicCommentsOpen();},
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text("General comments(public)",
                                        style: TextStyle(
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

                  /// Second Comment Section
                  GestureDetector(
                    onTap: (){togglePrivateCommentsOpen();},
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text("General comments(private)",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 26
                                )
                            ),
                            trailing: Icon(privateCommentsOpen ?
                            Icons.arrow_drop_down_sharp
                                : Icons.arrow_left_sharp),
                          ),
                          Container(

                          )
                        ],
                      ),
                    ),
                  ),
                  privateCommentsOpen?
                  _buildPrivateCommentsExample()
                      : Container(),
                ],
              )
          )
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

    var drawerElementsToDisplay = List.from(drawerItems);//List.from(widget.projectData.categories);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: const Center(
              child: Text("More detailed discussions"),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: drawerElementsToDisplay.length,
              itemBuilder: (BuildContext context, int index){
                return _buildDrawerListTile(drawerElementsToDisplay[index],index);
              })
        ],
      ),
    );
  }
  Widget _buildDrawerListTile(drawerElementToDisplay, int index){

    print(drawerElementToDisplay);

    return ListTile(
      leading: Icon(
        drawerElementToDisplay["icon"],
          color: _page == index
              ? Colors.orangeAccent
              : Colors.grey
      ),
      title: Text(drawerElementToDisplay["name"],
              style: TextStyle(
                  color: _page == index
                      ?Colors.orangeAccent
                      :Colors.grey
              )
      ),
    );
  }

  /// Helper functions


  // Takes the categories and builds a header and a text for each
  List<Widget> _createCategoryItemsWidgets(){

    List<Widget> widgetsToDisplayList = [];

    for(var i=0;i<widget.projectData.categories.length; i++){


      Widget headLineToDisplay = IntrinsicHeight(
        child: Stack(
          children: [
            Align(
                child:
                  Text(widget.projectData.categories[i],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 26
                    )
                  )
            ),
            Positioned(
              right:10,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowCommentsScreen(title: widget.projectData.categories[i],)),
                  );
                },
                child: Icon(FeatherIcons.messageSquare,
                  color: Colors.black.withOpacity(0.25),
                ),
              )
            ),
          ],
        ),
      );

      Widget contentToDisplay = _buildCloudyBackground(widget.projectData.categories_content[i]);

      Widget columnToDisplay = Column(
        children: [
          headLineToDisplay,
          SizedBox(height: 16,),
          contentToDisplay,
          SizedBox(height: 16,)
        ],
      );
      widgetsToDisplayList.add(columnToDisplay);
    }
    for(var i in customContentToAdd) widgetsToDisplayList.add(i);
    return widgetsToDisplayList;
  }

  void togglePublicCommentsOpen(){
    setState(() {
      publicCommentsOpen = !publicCommentsOpen;
    });
  }
  void togglePrivateCommentsOpen(){
    setState(() {
      privateCommentsOpen = !privateCommentsOpen;
    });
  }

  void _buildAddCustomCategoryDialog(){

    final textFieldController = TextEditingController();

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Add new category"),
            content: Container(
              width: screenSize.width/2,
              height: screenSize.height/6,
              child: Column(
                children: [
                  TextField(
                    controller: textFieldController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Category name",
                        suffixStyle: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _onPressAddCategory(textFieldController);
                    Navigator.pop(context);
                  });
                  },
                child: Text("OK"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent)
                ),
              ),
              ElevatedButton(
                onPressed: (){Navigator.pop(context);},
                child: Text("Cancel"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
                ),
              )
            ],
          );
        }
    );
  }

  void _onPressAddCategory(TextEditingController textFieldController){


    Widget headLineToDisplay = IntrinsicHeight(
      child: Stack(
        children: [
          Align(
              child:
              Text(textFieldController.text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 26
                  )
              )
          ),
          Positioned(
              right:10,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowCommentsScreen(title: textFieldController.text,)),
                  );
                },
                child: Icon(FeatherIcons.messageSquare,
                  color: Colors.black.withOpacity(0.25),
                ),
              )
          ),
        ],
      ),
    );
      Widget contentToDisplay = _buildCloudyBackground("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.");

      Widget columnToDisplay = Column(
        children: [
          headLineToDisplay,
          SizedBox(height: 16,),
          contentToDisplay,
          SizedBox(height: 16,),
        ],
      );
      customContentToAdd.add(columnToDisplay);
      print("after adding: " + contentToDisplayList.toString());
    }

  }

