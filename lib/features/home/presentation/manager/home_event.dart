part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoading extends HomeEvent {}

class LoadCoursesByCategory extends HomeEvent {
  final String categoryId;

  LoadCoursesByCategory(this.categoryId);
}
