import 'package:flutter/cupertino.dart';

class ProjectListData{
  ProjectListData({
    required this.title,
    required this.location,
    required this.creator,
    required this.imagePath,
    required this.topic,
    required this.state,
    required this.date,
    required this.regularly,
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
  bool regularly;
  String date;
  // stage = 0: Still in Planing, stage = 1: Planing finished. Looking for support.
  int state;
  List<String> categories;
  List<String> categories_content;
/*
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

 */
  static List<ProjectListData> projectListPreferences = <ProjectListData>[
    ProjectListData(
        title: "Organisation of a charity gala",
        topic: "politic",
        location: "Herne",
        creator: "Hans Wurst",
        organiser: "private person",
        state: 0,
        date: "21.12.21",
        regularly: false,
        imagePath: "assets/images/geo_abstract_bg_rose.jpg",
        categories: ["Idea","Structure","Financing"],
        categories_content: ["We would like to organise a charity gala where a few musicians will perform, several local restaurants will be present and every dime that will be spent will directly go to support the financing of the local research team who are working on a remedy for cancer.",
          "I, Matthias Schmidt, am the leader of this project. \n\n Jens Hammerhoff coordinates the bands. \n\n Dorothea Wald is responsible for the restaurants and their chefs. \n\n Julia Burscheidt takes care of the external communcation.\n\n If you have any questions please ask the suitable person.",
          "We will charge 10 € as admission price. A part of this money will be used to finance the event, the rest goes straight to the research team."]
    ),
    ProjectListData(
        title: "Instrumente aus Müll basteln",
        topic: "culture",
        location: "Dortmund",
        creator: "Hans Wurst",
        state: 0,
        date: "06.12.21",
        regularly: false,
        organiser: "private person",
        imagePath: "assets/images/geo_abstract_bg_blue.png",
        categories: ["Idee","Finanzierung", "Zeit und Ort", "Anmerkungen"],
        categories_content: [
          "Wir wollen aus alten Materialien, die beim Sperrmüll gefunden wurden, Instrumente bauen! Geplant sind Gitarren und Flöten!",
          "Die Stadt hat sich bereit erklärt, uns das Material kostenlos zu überlassen. Es fällt daher keine Gebühr an. ",
          "06.12.,13:00 Uhr, am Stadtgarten",
          "Wir haben nur für eine begrenzte Menge Menschen Material. Meldet euch daher bitte vorher an."]
    ),
    ProjectListData(
        title: "Entertaining retired people",
        topic: "voluntary work",
        location: "Essen",
        creator: "Hans Wurst",
        state: 1,
        date: "n/a",
        regularly: true,
        organiser: "private enterprise",
        imagePath: "assets/images/geo_abstract_bg_brown.jpg",
        categories: ["Idea","Schedule"],
        categories_content:[
          "The elder people are really bored in our retirement home. We would like to find people who would come once or twice a week to spend an hour or two with them ",
          "Currently, we are merely looking for volunteers. When we have found some people, we will update this part with the available schedule. ",
    ]
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
  date: "21.12.21",
  regularly: false,
  imagePath: "assets/images/geo_abstract_bg_rose.jpg",
  categories: ["Idea","Structure","Financing"],
  categories_content: ["We would like to organise a charity gala where a few musicians will perform, several local restaurants will be present and every dime that will be spent will directly go to support the financing of the local research team who are working on a remedy for cancer.",
  "I, Matthias Schmidt, am the leader of this project. \n\n Jens Hammerhoff coordinates the bands. \n\n Dorothea Wald is responsible for the restaurants and their chefs. \n\n Julia Burscheidt takes care of the external communcation.\n\n If you have any questions please ask the suitable person.",
  "We will charge 10 € as admission price. A part of this money will be used to finance the event, the rest goes straight to the research team."]
  )
  ];

  static List<ProjectListData> pastProjects = <ProjectListData>[
  ProjectListData(
  title: "Fussballturnier D-Jugend",
  location: "Bochum",
  creator: "Karl Schulz",
  imagePath: "assets/images/geo_abstract_bg_yellow.png",
  topic: "politics",
  state: 0,
  date: "04.08.21",
  regularly: false,
  organiser: "Private person",
  categories: ["Idee", "Aufteilung", "Zeit und Ort"],
  categories_content: [
    "Wir wollen den kleinen Rackern ein Turnier organisieren, weil sie immer wieder sagen, wie toll sie das fänden.",
    "Ich koordiniere uns alle.\n Der Schappe spricht mit der Stadt wegen der Location. \n Der Burak kümmert sich ums Bier. \n Der Jürgen kümmert sich um Bratwurst und so. \n Die anderen fragen nach, wo noch Not am Mann ist.",
    "04.08.21, 11:00 Uhr, Am Sportplatz hohe Halle"
  ]),
  ProjectListData(
  title: "Am Stadttor wollen wir gemeinsam ein Blumenbeet anlegen",
  location: "Bochum",
  creator: "Karl Schulz",
  imagePath: "assets/images/geo_abstract_bg_lila.png",
  topic: "politics",
  state: 0,
  date: "n/a",
  regularly: false,
  organiser: "Private person",
  categories: ["Idee", "Ressourcen", "Ort und Zeit"],
  categories_content: [
    "Steht im Titel. Ich hab Lust! Ihr auch?",
    "Ich würde sagen, wir schauen erst einmal, wer so alles dabei wäre, und dann sammeln wir hier, wer was mitbringt.",
    "Ich hatte so im Frühling gedacht, Ende Januar, Anfang Februar. Mal schauen, wie sich der Winter so entwickelt"
  ]),
  ];

  static List<ProjectListData> refinedList = <ProjectListData>[
    ProjectListData(
        title: "Unterstützung für Fördermittelbeantragung, wirtschaftlicher, kultureller und sozialer Akteure durch den RVR.",
        location: "Bochum",
        creator: "Karl Schulz",
        imagePath: "assets/images/geo_abstract_tow_colors_1.png",
        topic: "politics",
        state: 0,
        date: "n/a",
        regularly: false,
        organiser: "Private person",
        categories: ["Problemaufriss", "Lösungsansatz", "Finanzierbarkeit","Rechtliches","Weitergehender Ablauf","Welche Bereiche braucht es noch?"],
        categories_content: ["Es gibt zwar milliardenschwere Fördermittelsummen, von Land, Bund und EU. Diese können Begünstigte wegen dem hohen bürokratischen Aufwand jedoch nicht abrufen. Künstlern, Sozialarbeitern und Kleinunternehmen fehlen oft die verwaltungsjuristischen Kompetenzen oder die zeitlichen Möglichkeiten, sich durch den Bürokratiejungle zu hangeln.",
        "Der RVR (Regionalverband Ruhr), hat bereits eine Stelle eingerichtet, die den Mitgliedskommunalverwaltungen bei der Antragsstellung an die EU hilft. Wir wollen diese Stelle ausbauen, sodass auch Antragsberechtigten aus Kultur, Wirtschaft und Zivilgesellschaft geholfen wird. ",
        "Durch die effektive Zentralisierung auf den RVR werden die Kosten für die 38 Einzelkommunen gering bleiben. Gleichzeitig werden Milliardenbeträge in die heimische Wirtschaft, Kultur und Sozialarbeit gelenkt.\n\nHat da einer von euch vielleicht exakte Daten?\n\nHat einer von euch vielleicht eine Formel, wie man die Kostenbeteiligung der Kommunen nach ihrer finanziellen Tragfähigkeit ins Verhältnis setzen könnte?\n\nHabt ihr Ideen zur Kostenreduzierung?\n\nSchreibt es bitte in den Kommentarbereich.",
        "Hier habe ich leider nicht so viel Kompetenz. Deswegen bräuchte ich da eure Unterstützung.\n\nGibt es rechtliche Hürden, die die Antragsunterstützung nichtstaatlicher Akteure durch den Staat verbietet. Fällt das unter europarechtlich anzeigebdürftige staatliche Subventionierung?\n\nFalls ihr mir die Fragen beantworten könnt oder andere rechtliche Bedenken habt, haut mir das bitte hier in die Kommentarspalte.",
        "Ich würde für die Kommentierungs- und Ausarbeitungsphase erstmal 6 Wochen einplanen.\n\nDanach würde ich mich mit einer Anregung nach § 24 GO NRW an die Stadt Witten wenden, ob sie das fertige Konzept über den Kommunalrat (§14a RVRG) in den Regionalverband Ruhr einbringen könnte.\n\nSollte die Stadt Witten der Anregung nicht folgen, werden wir es über andere Kommunen im RVR versuchen.\n\nBringt auch dies nichts, ist mein Plan es über einen Einwohnerantrag (§ 25 GO NRW) oder ein Bürgerbegehren (§ 26 GO NRW) zu versuchen.",
        "Kommentiert bitte an diesen Bereich, wenn ich noch weitere Oberpunkte hinzufügen soll, um unseren Diskurs noch besser zu strukturieren."
        ]),
    ProjectListData(
        title: "Rüstige Rentnerin sucht morgendliche Lauffreunde",
        location: "Bochum",
        creator: "Karl Schulz",
        imagePath: "assets/images/vector_test2.png",
        topic: "politics",
        state: 0,
        date: "n/a",
        regularly: true,
        organiser: "Private person",
        categories: ["Idee", "Geschwindigkeit", "Ort","Zeit"],
        categories_content: ["Hallo ich versuche im Alter immer noch etwas aktiv zu sein. Das Laufen hat mir immer viel Spaß gemacht. Doch mein Lauffreund ist leider weggezogen. Deswegen suche ich jetzt hier nach Menschen, mit denen ich gemeinsam Joggen kann.\r\rBei Interesse schreibt mir das doch bitte unten in die Kommentarsektion.",
          "Hallo ich versuche im Alter immer noch etwas aktiv zu sein. Das Laufen hat mir immer viel Spaß gemacht. Doch mein Lauffreund ist leider weggezogen. Deswegen suche ich jetzt hier nach Menschen, mit denen ich gemeinsam Joggen kann.\r\rBei Interesse schreibt mir das doch bitte unten in die Kommentarsektion.",
          "Laufen würde ich gerne im Stadtteil West. Die genaue Route können wir im internen Bereich besprechen.",
          "Ich würde gerne morgens früh Joggen gehen. Der Wochentag ist mir egal.\r\r Genaueres würde ich gerne im internen Bereich besprechen.",
        ]),
    ProjectListData(
        title: "Instrumente aus Müll basteln",
        topic: "culture",
        location: "Dortmund",
        creator: "Hans Wurst",
        state: 0,
        date: "06.12.21",
        regularly: false,
        organiser: "private person",
        imagePath: "assets/images/geo_abstract_bg_blue.png",
        categories: ["Idee","Finanzierung", "Zeit und Ort", "Anmerkungen"],
        categories_content: [
          "Wir wollen aus alten Materialien, die beim Sperrmüll gefunden wurden, Instrumente bauen! Geplant sind Gitarren und Flöten!",
          "Die Stadt hat sich bereit erklärt, uns das Material kostenlos zu überlassen. Es fällt daher keine Gebühr an. ",
          "06.12.,13:00 Uhr, am Stadtgarten",
          "Wir haben nur für eine begrenzte Menge Menschen Material. Meldet euch daher bitte vorher an."]
    ),
  ];

}