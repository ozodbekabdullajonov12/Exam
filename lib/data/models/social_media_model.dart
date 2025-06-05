class SocialMediaModel {
  final int id;
  final String title, link, icon;

  SocialMediaModel({
    required this.id,
    required this.title,
    required this.link,
    required this.icon,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) {
    return SocialMediaModel(
      id: json['id'],
      title: json['title'],
      link: json['link'],
      icon: json['icon'],
    );
  }
}
