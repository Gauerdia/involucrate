class PopularFilterData{
  PopularFilterData({
     required this.titleText,
    required this.isSelected
});

  String titleText;
  bool isSelected;

  static List<PopularFilterData> topicFilterList = <PopularFilterData>[
    PopularFilterData(
        titleText: "Politics",
        isSelected: false),
    PopularFilterData(
        titleText: "Sport",
        isSelected: false),
    PopularFilterData(
        titleText: "Health",
        isSelected: false),
    PopularFilterData(
        titleText: "Animals",
        isSelected: false),
  ];

  static List<PopularFilterData> rangeFilterList = <PopularFilterData>[
    PopularFilterData(
        titleText: "communal",
        isSelected: false),
    PopularFilterData(
        titleText: "federal",
        isSelected: false),
    PopularFilterData(
        titleText: "national",
        isSelected: false),
    PopularFilterData(
        titleText: "european",
        isSelected: false),
    PopularFilterData(
        titleText: "global",
        isSelected: false),
  ];

  static List<PopularFilterData> optionFilterList = <PopularFilterData>[
    PopularFilterData(
        titleText: "Newsletter",
        isSelected: false),
    PopularFilterData(
        titleText: "Anonymous, also in the co-working space",
        isSelected: false),
    PopularFilterData(
        titleText: "Advertisement",
        isSelected: false),
  ];


}