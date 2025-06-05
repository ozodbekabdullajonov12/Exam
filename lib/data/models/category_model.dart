class CategoryModel {
  final int id;
  final String title, icon;
  final int totalCourses;

  CategoryModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.totalCourses,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      totalCourses: json['totalCourses'],
    );
  }
}
