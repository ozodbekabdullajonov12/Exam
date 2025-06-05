import 'package:ayol_uchun_exam/data/models/interview_model.dart';
import 'package:ayol_uchun_exam/data/models/social_media_model.dart';
import 'package:equatable/equatable.dart';
import 'package:ayol_uchun_exam/data/models/category_model.dart';
import 'package:ayol_uchun_exam/data/models/courses_model.dart';

enum HomeStatus { idle, loading, error }

class HomeState extends Equatable {
  final List<CoursesModel> courses;
  final List<CategoryModel> categories;
  final List<SocialMediaModel> socialAccounts;
  final List<InterviewModel> interviews;
  final HomeStatus status;

  const HomeState({
    required this.interviews,
    required this.courses,
    required this.categories,
    required this.socialAccounts,
    required this.status,
  });

  factory HomeState.initial() => const HomeState(
    interviews: [],
    courses: [],
    categories: [],
    socialAccounts: [],
    status: HomeStatus.loading,
  );

  HomeState copyWith({
    List<CoursesModel>? courses,
    List<CategoryModel>? categories,
    List<SocialMediaModel>? socialAccounts,
    List<InterviewModel>? interviews,
    HomeStatus? status,
  }) {
    return HomeState(
      courses: courses ?? this.courses,
      categories: categories ?? this.categories,
      status: status ?? this.status,
      socialAccounts: socialAccounts ?? this.socialAccounts,
      interviews: interviews ?? this.interviews,
    );
  }

  @override
  List<Object> get props => [
    courses,
    categories,
    status,
    socialAccounts,
    interviews,
  ];
}
