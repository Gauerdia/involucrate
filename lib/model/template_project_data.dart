
class TemplateProjectData{

  TemplateProjectData({
    required this.name,
    required this.categories
  });

  String name;
  List<String> categories;

  static List<TemplateProjectData> templateListExample = <TemplateProjectData>[
    TemplateProjectData(name: "Basic", categories: ["Title","Idea","Description"]),
    TemplateProjectData(name: "Business", categories: ["Title","Idea","Description", "Finance"]),
    TemplateProjectData(name: "Business Deluxe", categories: ["Title","Idea","Description","Finance", "Structure"]),
    TemplateProjectData(name: "Sport", categories: ["Title","Idea","Description","Table"]),
    ];

  static List<TemplateProjectData> templateDiscussionExample = <TemplateProjectData>[
    TemplateProjectData(name: "Discussion", categories: ["Title", "Proposition", "Pro arguments", "Con arguments","sources"]),
  ];

  static List<TemplateProjectData> templateEngagementExample = <TemplateProjectData>[
    TemplateProjectData(name: "Engagement", categories: ["Title", "Mission", "Description", "Meet'n'greet"])
  ];

}