class ShowModel {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final String organizer;

  ShowModel({
    required this.id,
    required this.title,
    required this.description,
    required this.organizer,
    required this.thumbnail,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      organizer: json['organizer'],
      thumbnail: json['thumbnail'],
    );
  }
}
