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

  static List<DiscussionListData> discussionListReal = <DiscussionListData>[
  DiscussionListData(
  title: "Videobeobachtung im öffentlichen Raum",
  topic: "Animals, voluntarily",
  location: "Anywhere",
  creator: "Hans Wurst",
  organiser: "Private person",
  imagePath: "assets/images/geo_abstract_bg_yellow.png",
  categories: ["Proposition","pro arguments","contra arguments", "sources"],
  categories_content: ["Während Ich automatische Gesichtserkennung als unverhältnismäßig ansehe und Videoüberwachung keinen wirklichen Mehrwert für die Sicherheit bringt, sollte Videobeobachtung erlaubt sein. Dabei soll in der Ermessensentscheidung besonders die örtlichen Strukturen berücksichtigt werden. Damit die Abwägung zwischen Raumstrukturellen Besonderheiten, die Kriminalität begünstigen und den Persönlichkeitsrechten der Einzelnen gelingt, wollen wir die Maßnahmen im engen Austausch mit Anwohnern absprechen. Wegen des Gewichts des Grundrechtseingriffs, soll die Maßnahme zusätzlich unter Richtervorbehalt gestellt werden.",
  "Videobeobachtung hat nicht nur repressive sondern auch präventive Effekte, weil ein Beamter in Echtzeit vor dem Bildschirm sitzt und im Notfall eingreifen kann.\n\nSexuelle Gewalt hat sich durch den Einsatz von Videobeobachtung, um über 30% reduziert.\n\nDer Staat zeigt, dass er raumstrukturellen Probleme warnimmt.",
  "Der Richtervorbehalt führ zu einer Verringerung der Effektivität der Gefahrenabwehr.\n\nRaumstrukturelle Probleme entstehen öfters in strukturell Schwachen Regionen. Dies könnte zu einer weiteren Stigmatisierung führen.\n\nEine pauschalisierte Überwachung ist ein Eingriff in die Persönlichkeitsrechte vieler.",
  "https://kfn.de/wp-content/uploads/Forschungsberichte/FB_143.pdf"]
  ),
    DiscussionListData(
        title: "Legaler Raum fürs Hacken",
        topic: "Animals, voluntarily",
        location: "Anywhere",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_bg_blue.png",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: [
          "Deutschland hat eine der größten Hackercommunities in Deutschland. Gleichzeitig haben grade kleine- und mittelständische Unternehmen meist keine eigene Stelle für IT-Sicherheit.\n\nDeswegen wäre es gut, wenn es einen Verein gebe, in dem sich hackinginteressiert versammeln können. Unternehmen können dann ihre Systeme - oder einen Dummy davon - zum Angriff zur Verfügung stellen. Bei Erfolg werden dem Unternehmen die Relevanten Daten zur Verfügung gestellt, um Sicherheitslücken zu schließen. Eine Behördliche Kooperation wäre wünschenswert, um vertrauen und Sicherheit zu gewährleisten. Dann könnte man vor jedem Hack den Ordnungsbehörden ein Fax senden.\n\nZusätzlich sollen an den Verein wirtschaftliche Akteure beteiligt sein, die Ausgründungen fördern.",
          "Hackingtalente können ihre Passion legal ausüben.\n\nDie IT Sicherheit in Deutschland verbessert sich.\n\nDie IT-Sicherheitswirtschaft in Deutschland wird gestärkt.",
          "Wir trainieren Leute die wissen, wie man Sicherheitslücken ausnutzt.\n\nWir binden Behördenressourcen.",
          "https://www.faz.net/aktuell/wirtschaft/digitec/wenig-geld-fuer-it-sicherheit-fataler-leichtsinn-17295171.html"]
    ),
    DiscussionListData(
        title: "Youtube hat ausgemistet - war das falsch?",
        topic: "Animals, voluntarily",
        location: "Anywhere",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_bg_rose.jpg",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: [
          "YouTube hat vor einem Monat unter anderem die Kanäle von RT Deutsch von ihrer Plattform verbannt. Ich hätte stattdessen, die Vorschlagsalgorithmen geändert, sodass nach einem RT Deutsch Video ein sachlich Einordnendes Video zum selben Thema kommt.",
          "Das Ausschließen problematischer Inhalte führt nur zur Abwanderung auf andere Plattformen, wo diese garkeiner Sozialen Kontrolle unterzogen sind.\n\nLetzlich rutschen wir immer weiter in voneinander getrennte  Blasen, die jegliche Übereinstimmungen entfernen und eine Rückanbindung fast unmöglich machen.\n\nSog. Verschwörungstheoretiker werden in ihrer Opferrolle bestärkt.",
          "Die Reichweite Problematischer Inhalte wird stark begrenzt, wenn sie nicht mehr über die Hauptmedien laufen.\n\nDie positive und negative Generalprävention wird durch YouTubes handeln erhöht.",
          "https://www.faz.net/aktuell/feuilleton/medien/youtube-sperrt-und-entfernt-kanaele-von-rt-de-17560234.html"]
    )
  ];

  static List<DiscussionListData> discussionListRealPreferred = <DiscussionListData>[
    DiscussionListData(
        title: "Youtube hat ausgemistet - war das falsch?",
        topic: "Animals, voluntarily",
        location: "Anywhere",
        creator: "Hans Wurst",
        organiser: "Private person",
        imagePath: "assets/images/geo_abstract_bg_rose.jpg",
        categories: ["Proposition","pro arguments","contra arguments", "sources"],
        categories_content: [
          "YouTube hat vor einem Monat unter anderem die Kanäle von RT Deutsch von ihrer Plattform verbannt. Ich hätte stattdessen, die Vorschlagsalgorithmen geändert, sodass nach einem RT Deutsch Video ein sachlich Einordnendes Video zum selben Thema kommt.",
          "Das Ausschließen problematischer Inhalte führt nur zur Abwanderung auf andere Plattformen, wo diese garkeiner Sozialen Kontrolle unterzogen sind.\n\nLetzlich rutschen wir immer weiter in voneinander getrennte  Blasen, die jegliche Übereinstimmungen entfernen und eine Rückanbindung fast unmöglich machen.\n\nSog. Verschwörungstheoretiker werden in ihrer Opferrolle bestärkt.",
          "Die Reichweite Problematischer Inhalte wird stark begrenzt, wenn sie nicht mehr über die Hauptmedien laufen.\n\nDie positive und negative Generalprävention wird durch YouTubes handeln erhöht.",
          "https://www.faz.net/aktuell/feuilleton/medien/youtube-sperrt-und-entfernt-kanaele-von-rt-de-17560234.html"]
    )
  ];

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