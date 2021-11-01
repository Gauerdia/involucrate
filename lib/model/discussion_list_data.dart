import 'package:flutter/cupertino.dart';

class DiscussionListData {
  DiscussionListData({
    required this.title,
    required this.location,
    required this.creator,
    required this.imagePath,
    required this.topic,
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
  List<String> categories;
  List<String> categories_content;

  static List<DiscussionListData> discussionListRandom = <DiscussionListData>[
    DiscussionListData(
        title: "Hydrogen fuel is superior to electricity",
        topic: "Animals, voluntarily",
        location: "Anywhere",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_bg_yellow.png",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
        "Trust me, bro"]
    ),
    DiscussionListData(
        title: "Democracy has to end",
        topic: "Animals, voluntarily",
        location: "Dortmund",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_tow_colors_1.png",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Trust me, bro"]
    ),
    DiscussionListData(
        title: "Dogs are far better for a society than cats",
        topic: "Animals, voluntarily",
        location: "Anywhere",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_bg_blue.png",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Trust me, bro"]
    ),
    DiscussionListData(
        title: "The huge parties do not care about us anymore...",
        topic: "Animals, voluntarily",
        location: "Bochum",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_bg_brown.jpg",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Trust me, bro"]
    ),
    DiscussionListData(
        title: "Does Germany do enough to enhance broadband?",
        topic: "Animals, voluntarily",
        location: "Gelsenkirchen",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_bg_lila.png",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Trust me, bro"]
    ),
  ];

  static List<DiscussionListData> discussionListPreferred = <DiscussionListData>[
    DiscussionListData(
        title: "The huge parties do not care about us anymore...",
        topic: "Politics",
        location: "Anywhere",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_bg_brown.jpg",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Trust me, bro"]
    ),
    DiscussionListData(
        title: "We need a new party for the labour interests!",
        topic: "Politics",
        location: "NRW",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_bg_rose.jpg",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Trust me, bro"]
    ),
    DiscussionListData(
        title: "Does Germany do enough to enhance broadband?",
        topic: "Politics",
        location: "Anywhere",
        creator: "Hans Wurst",
        organiser: "Private Person",
        imagePath: "assets/images/geo_abstract_bg_lila.png",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
          "Trust me, bro"]
    ),
  ];

}