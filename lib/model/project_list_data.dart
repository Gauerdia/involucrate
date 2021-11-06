import 'package:flutter/cupertino.dart';

class ProjectListData{
  ProjectListData({
    required this.title,
    required this.location,
    required this.creator,
    required this.imagePath,
    required this.topic,
    required this.state,
    required this.organiser,
    required this.categories,
    required this.categories_content
});

  String title;
  String location;
  String creator;
  String organiser;
  String imagePath;
  String topic;
  // stage = 0: Still in Planing, stage = 1: Planing finished. Looking for support.
  int state;
  List<String> categories;
  List<String> categories_content;

  static List<ProjectListData> projectListRandom = <ProjectListData>[
    ProjectListData(
      title: "Voluntary work in an animal shelter",
      topic: "Animals, voluntarily",
      location: "Dortmund",
      creator: "Hans Wurst",
      organiser: "government facilities",
      state: 0,
      imagePath: "assets/images/geo_abstract_bg_green.png",
      categories: ["Idea","Structure","Financing"],
      categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
                           "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
                           "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum."]
    ),
    ProjectListData(
        title: "Organizing a football tournament",
        topic: "sport",
        location: "Bochum",
        creator: "Hans Wurst",
        state: 0,
        organiser: "private person",
        imagePath: "assets/images/geo_abstract_bg_lila.png",
        categories: ["Idea","Financing"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
                             "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. "]
    ),
    ProjectListData(
        title: "Municipal student consultant",
        topic: "voluntarily, politic",
        location: "Herne",
        creator: "Hans Wurst",
        organiser: "private enterprise",
        state: 1,
        imagePath: "assets/images/geo_abstract_bg_blue.png",
        categories: ["Idea","Financing","Schedule"],
        categories_content:["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. "]
    ),
    ProjectListData(
        title: "Teaching math to poor children",
        topic: "art, culture",
        location: "Gelsenkirchen",
        creator: "Hans Wurst",
        organiser: "private person",
        state: 1,
        imagePath: "assets/images/geo_abstract_bg_yellow.png",
        categories: ["Idea","Financing","Annotations"],
        categories_content:["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. "]
    ),
    ProjectListData(
        title: "Jogging for climate change",
        topic: "sport",
        location: "Bonn",
        creator: "Hans Wurst",
        organiser: "private",
        state: 0,
        imagePath: "assets/images/vector_test2.png",
        categories: ["Idea","Financing"],
        categories_content:["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. "]
    ),
  ];

  static List<ProjectListData> projectListPreferences = <ProjectListData>[
    ProjectListData(
        title: "Organisation of a charity gala",
        topic: "politic",
        location: "Herne",
        creator: "Hans Wurst",
        organiser: "private person",
        state: 0,
        imagePath: "assets/images/geo_abstract_bg_rose.jpg",
        categories: ["Idea","Structure","Financing"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum."]
    ),
    ProjectListData(
        title: "Creating instruments with trash",
        topic: "culture",
        location: "Bochum",
        creator: "Hans Wurst",
        state: 0,
        organiser: "private person",
        imagePath: "assets/images/geo_abstract_tow_colors_1.png",
        categories: ["Idea","Financing"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. "]
    ),
    ProjectListData(
        title: "Entertaining retired people",
        topic: "voluntary work",
        location: "Essen",
        creator: "Hans Wurst",
        state: 1,
        organiser: "private enterprise",
        imagePath: "assets/images/geo_abstract_bg_brown.jpg",
        categories: ["Idea","Financing","Schedule"],
        categories_content:["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. "]
    ),
  ];

  static List<ProjectListData> projectListOwnProjects = <ProjectListData>[
  ProjectListData(
  title: "Organisation of a charity gala",
  topic: "politic",
  location: "Herne",
  creator: "Hans Wurst",
  organiser: "private person",
  state: 0,
  imagePath: "assets/images/geo_abstract_bg_rose.jpg",
  categories: ["Idea","Structure","Financing"],
  categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum."]
  )
  ];

}