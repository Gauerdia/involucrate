class ProfileData{
  ProfileData({
    required this.name,
    required this.surname,
    required this.shortSum,
    required this.location,
    required this.profession,
    required this.engagement
});

  String name;
  String surname;
  String shortSum;
  String location;
  String profession;
  String engagement;

  static List<ProfileData> profileDataList = <ProfileData>[
    ProfileData(
        name: "Marcel",
        surname: "Davis",
        shortSum: "I'd love to learn something new every day.",
        location: "Barcelona",
        profession: "Web-Designer",
        engagement: "WHO"
    )
    ];

}