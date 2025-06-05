class InterviewModel {
  final int id;
  final String title, image, user;
  final int duration;

  InterviewModel({
    required this.id,
    required this.title,
    required this.image,
    required this.user,
    required this.duration,
  });

  factory InterviewModel.fromJson(Map<String, dynamic> json) {
    return InterviewModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      user: json['user'],
      duration: json['duration'],
    );
  }
}
