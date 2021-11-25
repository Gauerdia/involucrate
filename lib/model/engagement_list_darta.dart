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
        mission: "Volt wurde aufgrund von wachsendem Rechtspopulismus und des Brexits gegründet. Diese Entwicklungen haben Europa gespalten und nationale Problematiken in den Vordergrund gestellt. Als Bewegung und Partei fokussieren wir uns auf die Lösungen, die Europa hat und sehen all das positive Potenzial, das wir gemeinsam nutzen können. Auf unserem Weg sehen wir jeden einzelnen Menschen als Bereicherung und eine Chance zu lernen, zu wachsen und Europa zu reformieren. Wir wollen einen grenzübergreifenden politischen Ansatz für Europa, um neue, pragmatische und progressive Antworten auf die Herausforderungen unserer Zeit zu finden.",
        meetNGreetDate: "Jeden Montag in der CU Bar in Dortmund, 19 p.m.",
        description: "Europäische Herausforderungen brauchen europäische Lösungen. Dabei stoßen nationale Parteien an ihre Grenzen und populistische Versprechen setzen unseren Frieden aufs Spiel. Deswegen haben wir Volt gegründet, eine Bewegung und Partei für ganz Europa.\n\nWir sind die erste paneuropäische Partei – grenzübergreifend machen wir Politik für ein föderales Europa. In 29 Ländern bewegen wir Bürgerinnen und Bürger dazu, auf lokaler, nationaler und europäischer Ebene Politik neu zu denken und mitzugestalten.\n\nWir sind paneuropäisch, pragmatisch und progressiv. Vor dem Hintergrund gemeinsamer Werte und Ziele stellen wir mutige Fragen und machen umsetzbare Vorschläge zur Lösung gesamteuropäischer Missstände."
            ),
    EngagementListData(
        name: "Young Perspectives Ruhr",
        catchPhrase:  "Die Denkfabrik aus'm Pott",
        location: "Bochum",
        imagePath: "assets/images/geo_abstract_bg_green.png",
        mission: "yp.ruhr trägt junge Perspektiven mit seiner Forschung, Beratung und den Ideen seiner Mitglieder über einen regionalen Ansatz in die  Politik, Wirtschaft und Gesellschaft.\n\n yp.ruhr bietet als Denkfabrik den Raum für gesellschaftspolitische Diskussionen und Themen.\n\n yp.ruhr verschafft den jungen Perspektiven Gehör.",
        meetNGreetDate: "Alle zwei Wochen Mittwochs am Fiege-Brauhaus",
        description: "yp.ruhr ist überparteilich tätig, d.h. wir sprechen mit jeder und jedem und wollen alle Perspektiven kennenlernen.\n\nWir respektieren die Meinung anderer.\n\nWir lehnen Hass, Hetze, Rassismus, Sexismus und LGBTQ-Feindlichkeit in jeglicher Form ab und ziehen hier die Grenze der Argumentation.\n\nWir argumentieren auf wissenschaftlicher Basis.\n\nWir organisieren uns holokratisch, d.h. wir leben offene Strukturen und arbeiten in agilen Kreisen und Arbeitsgruppen mit einem offenen Austausch"
    ),
    EngagementListData(
        name: "unicef",
        catchPhrase:  "Eine faire Chance für jedes Kind!",
        location: "Bochum",
        imagePath: "assets/images/geo_abstract_bg_blue.png",
        mission: "des Kind auf der Welt hat das Recht auf eine Kindheit – wir sind dafür da, dass aus diesem Recht Wirklichkeit wird. UNICEF wurde 1946 gegründet und hilft Kindern in rund 190 Ländern. Gemeinsam mit vielen Unterstützern und Partnern versorgt UNICEF jedes dritte Kind weltweit mit Impfstoffen, stattet Schulen aus und setzt sich politisch ein – zum Beispiel für wirksame Kinderschutzgesetze.",
        meetNGreetDate: "Schreibt uns an, wenn ihr mehr wissen wollt!",
        description: "3 gute Gründe zum Mitmachen:\n\nGestalte dein Engagement so, wie du möchtest. In der Hochschulgruppe habt ihr viel Freiraum bei euren konkreten Aktionen. Gemeinsam entscheidet ihr, auf welche Weise ihr euch für Kinder einsetzen wollt: Ein Benefizkonzert oder ein Poetry-Slam, Becherpfand sammeln auf einem Festival, eine Schulstunde über Kinderrechte, eine Ausstellung oder oder oder... \n\nQualifiziere dich weiter. Wir bieten dir regelmäßig die Möglichkeit, dich weiterzubilden. So gibt es mehrmals im Jahr Workshops zu verschiedenen Themen, bei denen du dich auch mit anderen HSG-Mitgliedern austauschen kannst. \n\nSei Teil einer internationalen Organisation. Wir von UNICEF sind in über 150 Ländern weltweit aktiv, um uns für Kinder einzusetzen. Unsere Experten wissen, was zu tun ist: ob eine Naturkatastrophe passiert, Kinder auf der Flucht Hilfe brauchen oder eine neue Schule eingerichtet werden soll. Mit uns kannst du wirklich was bewegen – und wir mit dir."
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