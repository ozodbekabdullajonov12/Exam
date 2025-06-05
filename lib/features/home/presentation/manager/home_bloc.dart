import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ayol_uchun_exam/data/repositories/course_repository.dart';
import 'package:ayol_uchun_exam/features/home/presentation/manager/home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CourseRepository _repo;

  HomeBloc({required CourseRepository repo})
    : _repo = repo,
      super(HomeState.initial()) {
    on<HomeLoading>(_onHomeLoading);
    on<LoadCoursesByCategory>(_onLoadCoursesByCategory);
  }

  Future<void> _onHomeLoading(
    HomeLoading event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final courses = await _repo.fetchCourses();
      final categories = await _repo.fetchCategories();
      final socialAccounts = await _repo.fetchSocialAccounts();
      final interviews = await _repo.fetchInterviews();

      emit(
        state.copyWith(
          courses: courses,
          categories: categories,
          socialAccounts: socialAccounts,
          status: HomeStatus.idle,
          interviews: interviews,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint("Xato bo'ldi: $e");
      debugPrint(stackTrace.toString());
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<void> _onLoadCoursesByCategory(
    LoadCoursesByCategory event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final filteredCourses = await _repo.fetchCourses(
        categoryId: event.categoryId,
      );

      emit(state.copyWith(courses: filteredCourses, status: HomeStatus.idle));
    } catch (e) {
      debugPrint("Filter bo'yicha kurslar yuklashda xato: $e");
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
