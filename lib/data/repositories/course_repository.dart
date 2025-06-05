import 'package:ayol_uchun_exam/core/client.dart';
import 'package:ayol_uchun_exam/data/models/category_model.dart';
import 'package:ayol_uchun_exam/data/models/courses_model.dart';
import 'package:ayol_uchun_exam/data/models/interview_model.dart';
import 'package:ayol_uchun_exam/data/models/social_media_model.dart';

class CourseRepository {
  final ApiClient client;

  List<CoursesModel>? courses;
  List<CategoryModel>? categories;
  List<SocialMediaModel>? socialAccounts;
  List<InterviewModel>? interviews;

  CourseRepository({required this.client});

  Future<List<CoursesModel>> fetchCourses({String? categoryId}) async {
    final isUnfiltered = categoryId == null;
    if (isUnfiltered && courses != null) return courses!;

    final raw = await client.fetchCourses(categoryId: categoryId);

    final result = raw.map((e) => CoursesModel.fromJson(e)).toList();
    if (isUnfiltered) courses = result;

    return result;
  }

  Future<List<CategoryModel>> fetchCategories() async {
    if (categories != null) return categories!;
    final raw = await client.fetchCategories();
    categories = raw.map((e) => CategoryModel.fromJson(e)).toList();
    return categories!;
  }

  Future<List<SocialMediaModel>?> fetchSocialAccounts() async {
    final raw = await client.fetchSocialAccounts();
    socialAccounts = raw.map((e) => SocialMediaModel.fromJson(e)).toList();
    return socialAccounts;
  }

  Future<List<InterviewModel>?> fetchInterviews() async {
    final raw = await client.fetchInterviews(3);
    interviews = raw.map((e) => InterviewModel.fromJson(e)).toList();
    return interviews;
  }
}
