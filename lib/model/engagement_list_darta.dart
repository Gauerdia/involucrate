class EngagementListData{

  EngagementListData({
    required this.name,
    required this.catchPhrase,
    required this.location,
    required this.imagePath,
    required this.mission,
    required this.meetNGreetDate,
    required this.description
  });

  String name;
  String catchPhrase;
  String location;
  String imagePath;
  String mission;
  String meetNGreetDate;
  String description;


  static List<EngagementListData> exampleRandomList = <EngagementListData>[
    EngagementListData(
        name: "VOLT Deutschland",
        catchPhrase:  "Let's build a united europe!",
        location: "Dortmund",
        imagePath: "assets/images/geo_abstract_bg_lila.png",
        mission: "Lorem Issum",
        meetNGreetDate: "Every monday in the CU Bar in Dortmund, 19 p.m.",
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
    ),
    EngagementListData(
        name: "Young Perspectives Ruhr",
        catchPhrase:  "Die Denkfabrik aus'm Pott",
        location: "Bochum",
        imagePath: "assets/images/geo_abstract_bg_green.png",
        mission: "Lorem Issum",
        meetNGreetDate: "Every monday in the CU Bar in Dortmund, 19 p.m.",
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

    ),
    EngagementListData(
        name: "unicef",
        catchPhrase:  "Eine faire Chance für jedes Kind!",
        location: "Bochum",
        imagePath: "assets/images/geo_abstract_bg_blue.png",
        mission: "Lorem Issum",
        meetNGreetDate: "Every monday in the CU Bar in Dortmund, 19 p.m.",
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

    ),
  ];


  static List<EngagementListData> examplePreferredList = <EngagementListData>[
    EngagementListData(
        name: "unicef",
        catchPhrase:  "Eine faire Chance für jedes Kind!",
        location: "Bochum",
        imagePath: "assets/images/geo_abstract_bg_blue.png",
        mission: "Lorem Issum",
        meetNGreetDate: "Every monday in the CU Bar in Dortmund, 19 p.m.",
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

    ),
  ];

}