
class TemplateProjectData{

  TemplateProjectData({
    required this.name,
    required this.categories
  });

  String name;
  List<String> categories;

  static List<TemplateProjectData> templateListExample = <TemplateProjectData>[
    TemplateProjectData(
        name: "Sportveranstaltung",
        categories: ["Titel","Idee","Tagesablauf","Turnierplan","Fianzierung","Benötigte Sachmittel","Veranstaltungsort","Termin"]),
    TemplateProjectData(name: "Hobby",
        categories: ["Titel","Idee","Termin", "Ort","Ausrüstung"]),
    TemplateProjectData(name: "Demo",
        categories: ["Titel","Anlass","Route","Termin", "Hygienekonzept","Rechtliches"]),
    TemplateProjectData(name: "Vereingsgründung",
        categories: ["Titel","Vereinszweck","Vereinsvertrag","Vereinsbeiträge"]),
    ];

  static List<TemplateProjectData> templateDiscussionExample = <TemplateProjectData>[
    TemplateProjectData(name: "Discussion", categories: ["Title", "Proposition", "Pro arguments", "Con arguments","sources"]),
  ];

  static List<TemplateProjectData> templateEngagementExample = <TemplateProjectData>[
    TemplateProjectData(name: "Engagement", categories: ["Title", "Mission", "Description", "Meet'n'greet"])
  ];

}