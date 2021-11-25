import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:involucrate/components/test_tab_header.dart';
import 'package:involucrate/model/project_list_data.dart';
import 'package:involucrate/model/template_project_data.dart';
import 'package:involucrate/theme/theme_config.dart';
import 'package:involucrate/views/project/show_project_screen.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {

  // To display in the header
  String headLineText = "Create new...";

  bool fadeInFirstItem = false;
  bool fadeInProject = false;
  bool fadeInProjectCategories = false;
  bool fadeInDiscussion = false;
  bool fadeInEngagement = false;

  // Adapt the sizes to the dimensions of the user's phone
  late Size screenSize;

  // Needed for the nestedScrolling, which enables Sliver
  final ScrollController _scrollController = ScrollController();

  // Needed to switch between the views
  bool projectChosen = false;
  bool discussionChosen = false;
  bool engagementChosen = false;

  // Offers categories to choose from
  List<TemplateProjectData> projectTemplateList = TemplateProjectData.templateListExample;
  TemplateProjectData discussionTemplate = TemplateProjectData.templateDiscussionExample.first;
  TemplateProjectData engagementTemplate = TemplateProjectData.templateEngagementExample.first;

  // Stores the selection of the drop down menu
  String _dropDownValue = "";

  // Taken from the templates
  List<String> projectCategoriesToDisplay = [];

  // Storing the controllers for the textfields dynamically
  Map<String, TextEditingController> _controllerMap = Map();
  // If the user changes the templates after already filling some textfields,
  // we should delete the controllers to inhibit errors.
  bool projectTemplateAlreadyChosen = false;


  // Creating variables to fill the new project with the inputs
  String new_title = "";
  String new_location = "Bochum";
  String new_creator = "Karl Fritz";
  String new_organiser = "Karl Fritz";
  String new_imagePath = "assets/images/abstract_wallpaper_2.jpg";
  String new_date = "n/a";
  bool new_regularly = false;
  int new_state = 0;
  String new_topic = "Politics";
  List<String> new_categories = [];
  List<String> new_categories_content = [];

  @override
  void dispose(){
    new_categories = [];
    new_categories_content = [];
    _controllerMap.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(microseconds: 36660),(){
      setState(() {
        fadeInFirstItem = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Theme.of(context).dialogBackgroundColor,
        margin: const EdgeInsets.only(top: 0),
        child: _buildMainStack(context), //_mainColumn(),
      ),
    );
  }

  /// Overall structure

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
                                _buildTitleImage()
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
                          headLineText.length
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
  Widget _buildContentContainer(){

    return Container(
        color: Theme
            .of(context)
            .backgroundColor,
        child: SingleChildScrollView(
            child: Column(
              children: [
                _buildWhatToCreate(),
                _buildTemplateDropDown(),
                _checkIfButtonsAreNeeded(),
                SizedBox(height: 20,),
              ],
            )
        )
    );
  }

  /// Head of view

  Widget _buildTitleImage(){
    return AspectRatio(
      aspectRatio: 1.5,
      child: Image.asset(
          "assets/images/create1.jpg",
          fit: BoxFit.fill),
    );
  }
  Widget _buildPersistantHeader(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(3)
      ),
      height: 500,
      child: Padding(
        padding: EdgeInsets.only(top:8),
        child: Text(headLineText,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 32
            )
        ),
      ),
    );
  }

  /// Shared by all three
  Widget _buildWhatToCreate(){

    return AnimatedOpacity(
        opacity: fadeInFirstItem? 1.0  : 0.0,
        duration: const Duration(milliseconds: 500),
    child: Container(
      padding: EdgeInsets.only(top: 16, bottom: 0),
      width: screenSize.width,
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(top:16, bottom: 32, left: 8),
                child: Text("1) What do you want to create?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: screenSize.width,
            padding: EdgeInsets.only(top: 8,bottom: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(90.0),
                  topLeft: Radius.circular(90.0),
                  bottomLeft: Radius.circular(10.0)
              ),
              border: Border.all(
                  color: Colors.black12,
                  width: 1
              ),
              color: Colors.grey[500],
            ),
            child: Row(
              children: [
                /// Project-Button
                GestureDetector(
                  onTap: (){_toggleProjectChosen();},
                  child: Padding(
                    padding: EdgeInsets.only(left: 36, top: 8,bottom: 8, right:8),
                    child: Text("Project",
                      style: TextStyle(
                          fontSize: 22,
                          color: projectChosen? Colors.orangeAccent : Colors.grey[200]
                      ),
                    ),
                  ),
                ),
                /// Discussion-Button
                GestureDetector(
                  onTap: (){_toggleDiscussionChosen();},
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, top: 8,bottom: 8, right:8),
                    child: Text("Discussion",
                      style: TextStyle(
                          fontSize: 22,
                          color: discussionChosen? Colors.orangeAccent : Colors.grey[200]
                      ),
                    ),
                  ),
                ),
                /// Engagement-Button
                GestureDetector(
                  onTap: (){_toggleEngagementChosen();},
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, top: 8,bottom: 8, right:8),
                    child: Text("Engagement",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 22,
                          color: engagementChosen? Colors.orangeAccent : Colors.grey[200]
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
    );


    /*
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 0),
      width: screenSize.width,
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(top:16, bottom: 32, left: 8),
                child: Text("1) What do you want to create?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: screenSize.width,
            padding: EdgeInsets.only(top: 8,bottom: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(90.0),
                  topLeft: Radius.circular(90.0),
                  bottomLeft: Radius.circular(10.0)
              ),
              border: Border.all(
                  color: Colors.black12,
                  width: 1
              ),
              color: Colors.grey[500],
            ),
            child: Row(
              children: [
                /// Project-Button
                GestureDetector(
                  onTap: (){_toggleProjectChosen();},
                  child: Padding(
                    padding: EdgeInsets.only(left: 36, top: 8,bottom: 8, right:8),
                    child: Text("Project",
                      style: TextStyle(
                          fontSize: 22,
                          color: projectChosen? Colors.orangeAccent : Colors.grey[200]
                      ),
                    ),
                  ),
                ),
                /// Discussion-Button
                GestureDetector(
                  onTap: (){_toggleDiscussionChosen();},
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, top: 8,bottom: 8, right:8),
                    child: Text("Discussion",
                      style: TextStyle(
                          fontSize: 22,
                          color: discussionChosen? Colors.orangeAccent : Colors.grey[200]
                      ),
                    ),
                  ),
                ),
                /// Engagement-Button
                GestureDetector(
                  onTap: (){_toggleEngagementChosen();},
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, top: 8,bottom: 8, right:8),
                    child: Text("Engagement",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 22,
                          color: engagementChosen? Colors.orangeAccent : Colors.grey[200]
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

     */
  }
  Widget _buildTemplateDropDown(){
    return Container(
        child: projectChosen
            ? _buildWantToCreateProject()
            : discussionChosen
            ? _buildWantToCreateDiscussion()
            : engagementChosen
            ? _buildWantToCreateEngagement()
            : Container()
    );
  }

  /// Buttons

  Widget _checkIfButtonsAreNeeded(){

    return projectTemplateAlreadyChosen
        ? _buildButtonRow()
        : discussionChosen
        ? _buildButtonRow()
        : engagementChosen
        ? _buildButtonRow()
        : Container();

  }
  Widget _buildButtonRow(){
    return Row(
      children: [
        _buildOkButton(),
        _buildCancelButton()
      ],
    );
  }
  Widget _buildOkButton(){
    return Padding(
      padding: const EdgeInsets.only(left: 16,top: 16),
      child: ElevatedButton(

          onPressed: () async{onPressCreateButton();},

          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              elevation: 9,
              shadowColor: Colors.red,
              primary: Colors.transparent
          ),

          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.orangeAccent, Colors.grey],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(minWidth: 88.0),
              alignment: Alignment.center,
              child: const Text(
                "Create",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
              ),
            ),
          )
      ),
    );
  }
  Widget _buildCancelButton(){
    return Padding(
      padding: const EdgeInsets.only(left: 16,top: 16),
      child: ElevatedButton(

          onPressed: () async{
            setState(() {
              _controllerMap.forEach((key, controller) {
                controller.text = key;
              });
            });
          },

          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              elevation: 9,
              shadowColor: Colors.red,
              primary: Colors.transparent
          ),

          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.redAccent, Colors.grey],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(minWidth: 88.0),
              alignment: Alignment.center,
              child: const Text(
                "Cancel",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
              ),
            ),
          )
      ),
    );
  }

  /// Switching through the sorts of templates
  Widget _buildWantToCreateProject(){

    Timer(const Duration(microseconds: 1000),(){
      setState(() {
        fadeInProject = true;
      });
    });
    return AnimatedOpacity(
        opacity: fadeInProject ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
    child: Container(
        child:Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 32, left: 8, top:48),
                  child: Text("2) Which template do you want to use?",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),

            _buildDropDownMenu(),

            projectCategoriesToDisplay.isNotEmpty
                ? _buildDropDownClickedShowCategories() : Container(),

          ],
        )
    ),
    );

  }
  Widget _buildWantToCreateDiscussion(){

    projectCategoriesToDisplay = discussionTemplate.categories;


    Timer(const Duration(microseconds: 1000),(){
      setState(() {
        fadeInDiscussion = true;
      });
    });

    return AnimatedOpacity(
      opacity: fadeInDiscussion ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top:38, bottom: 16, left:8),
                  child: Row(
                    children: const [
                      Text("2) Tell us more about your discussion!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: projectCategoriesToDisplay.length,
                  itemBuilder: (BuildContext context, int index){

                    final controller = _getControllerOf(projectCategoriesToDisplay[index]);
                    return Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(projectCategoriesToDisplay[index],
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                        _buildTextField(controller)
                      ],
                    );
                  }
              )
            ],
          )
      ),
    );
  }
  Widget _buildWantToCreateEngagement(){
    projectCategoriesToDisplay = engagementTemplate.categories;

    Timer(const Duration(microseconds: 2000),(){
      setState(() {
        fadeInEngagement = true;
      });
    });

    return AnimatedOpacity(
      opacity: fadeInEngagement ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top:38, bottom: 16, left:8),
                  child: Row(
                    children: const [
                      Text("2) Tell us more about your engagement!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: projectCategoriesToDisplay.length,
                  itemBuilder: (BuildContext context, int index){

                    final controller = _getControllerOf(projectCategoriesToDisplay[index]);
                    return Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(projectCategoriesToDisplay[index],
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                        _buildTextField(controller)
                      ],
                    );
                  }
              )
            ],
          )
      ),
    );

  }

  Widget _buildDropDownMenu(){
    return DropdownButton(
      hint: _dropDownValue == ""
          ? const Text('Please choose a template')
          : Text(
        _dropDownValue,
        style: const TextStyle(color: Colors.blueGrey),
      ),
      isExpanded: true,
      iconSize: 30.0,
      style: const TextStyle(color: Colors.grey),
      items: projectTemplateList.map(
            (val) {
          // Adding the categories to the dropdown item
          String addCategoryText = "";
          for(var i in val.categories) {
            addCategoryText += i.toString();
            if(i != val.categories.last){
              addCategoryText += ",";
            }
          }
          // Creating the actual dropdown item
          return DropdownMenuItem<String>(
            value: val.name,
            child: Text(val.name + " (" + addCategoryText + ")"),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(() {
          if(!projectTemplateAlreadyChosen){
            projectTemplateAlreadyChosen = true;
          }else{
            _clearController();
          }
          _dropDownValue = val.toString();
          TemplateProjectData findCategories = projectTemplateList.where(
                  (element) => element.name == _dropDownValue).first;
          projectCategoriesToDisplay = findCategories.categories;
        });
      },
    );
  }
  Widget _buildDropDownClickedShowCategories(){

    Timer(const Duration(microseconds: 1000),(){
      setState(() {
        fadeInProjectCategories = true;
      });
    });

    return AnimatedOpacity(
        opacity: fadeInProjectCategories? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top:38, bottom: 16, left:8),
              child: Row(
                children: const [
                  Text("3) Tell us more about your project!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              )
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: projectCategoriesToDisplay.length,
              itemBuilder: (BuildContext context, int index){

                final controller = _getControllerOf(projectCategoriesToDisplay[index]);
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(projectCategoriesToDisplay[index],
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        // This is a delete button on the right side but it didnt
                        // work as expected

                        /*
                        projectCategoriesToDisplay[index] != "Title"
                        ? GestureDetector(
                          onTap: (){
                            setState(() {
                              print(_controllerMap);
                              projectCategoriesToDisplay.removeAt(index);
                              _controllerMap.remove(projectCategoriesToDisplay[index]);
                              print(_controllerMap);
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(FeatherIcons.xCircle,
                              color: Colors.red,
                            ),
                          ),
                        )

                        : Container(),

                         */
                      ],
                    ),
                    _buildTextField(controller)
                  ],
                );
              }
          ),
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
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller){
    return Padding(
      padding: EdgeInsets.only(top:16,bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.white54,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey,width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey,width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey,width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey,width: 1),
          ),
          hintText: "Write some further details about your project!",
          hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
              letterSpacing: 0.22
          ),
        ),
      ),
    );
  }


  /// Helper functions

  void _toggleProjectChosen(){


    if(discussionChosen){
      fadeInDiscussion = false;
      _toggleDiscussionChosen();
    }
    if(engagementChosen){
      fadeInEngagement = false;
      _toggleEngagementChosen();
    }
    setState(() {

      // Setting the vars so that jumping around doesnt harm anything.
      _dropDownValue = "";
      projectCategoriesToDisplay = [];
      _clearController();
      new_categories = [];
      new_categories_content = [];

      projectChosen = !projectChosen;
    });
  }
  void _toggleDiscussionChosen(){
    if(projectChosen){
      fadeInProject = false;
      projectTemplateAlreadyChosen = false;
      _toggleProjectChosen();
    }
    if(engagementChosen){
      fadeInEngagement = false;
      _toggleEngagementChosen();
    }
    setState(() {

      // Setting the vars so that jumping around doesnt harm anything.
      _dropDownValue = "";
      projectCategoriesToDisplay = [];
      _clearController();
      new_categories = [];
      new_categories_content = [];

      discussionChosen = !discussionChosen;
    });
  }
  void _toggleEngagementChosen(){
    if(projectChosen){
      fadeInProject = false;
      projectTemplateAlreadyChosen = false;
      _toggleProjectChosen();
    }
    if(discussionChosen){
      fadeInDiscussion = false;
      _toggleDiscussionChosen();
    }
    setState(() {

      // Setting the vars so that jumping around doesnt harm anything.
      projectCategoriesToDisplay = [];
      _clearController();
      new_categories = [];
      new_categories_content = [];

      engagementChosen = !engagementChosen;
    });
  }

  TextEditingController _getControllerOf(String name){
    var controller = _controllerMap[name];
    if(controller == null){
      controller = TextEditingController(text: "Write some further information!");
      _controllerMap[name] = controller;
    }
    return controller;
  }
  void _clearController(){
   // _controllerMap.forEach((key, controller) => controller.clear());
  _controllerMap = Map();
  }

  void onPressCreateButton(){
    String text = _controllerMap.values
        .where((element) => element.text != "")
        .fold("", (previousValue, element) => previousValue += "${element.text}\n");
    setState(() {
      _controllerMap.forEach((key, controller) {
        int index = _controllerMap.keys.toList().indexOf(key);
        print("key: " + key);
        //key = controller.text;

        if(key == "Title"){
          new_title = controller.text;
          print("new_title: " + new_title);
        }else{
          new_categories.add(key);
          print("new categories: " + key);
          new_categories_content.add(controller.text);
          print("new_categories_content: " + controller.text);
        }

        print(controller.text);
      });
    });

    ProjectListData newProject = ProjectListData(
        title: new_title,
        location: new_location,
        creator: new_creator,
        imagePath: new_imagePath,
        topic: new_topic,
        state: new_state,
        date: new_date,
        regularly: new_regularly,
        organiser: new_organiser,
        categories: new_categories,
        categories_content: new_categories_content);

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context){
          _clearController();
          return ShowProjectScreen(projectData: newProject,
          showCaseCreateProject: true,);
        })
    );
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
                projectCategoriesToDisplay.add(textFieldController.text);
              });
              Navigator.pop(context);},
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

}
