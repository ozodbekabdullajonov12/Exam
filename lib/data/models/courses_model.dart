class CoursesModel {
  final int id;
  final String? user, category, title, image, status;
  final int price;
  final int rating;

  CoursesModel({
    required this.id,
    required this.user,
    required this.category,
    required this.title,
    required this.image,
    required this.status,
    required this.price,
    required this.rating,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      id: (json['id'] as num).toInt(),
      user: (json['user'] ?? '')?.toString(),
      category: (json['category'] ?? '')?.toString(),
      title: (json['title'] ?? '')?.toString(),
      image: (json['image'] ?? '')?.toString(),
      status: (json['status'] ?? '')?.toString(),
      price: (json['price'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
    );
  }


}
