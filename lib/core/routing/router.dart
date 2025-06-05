import 'package:ayol_uchun_exam/core/routing/routes.dart';
import 'package:ayol_uchun_exam/features/auth/presentation/manager/login/login_bloc.dart';
import 'package:ayol_uchun_exam/features/auth/presentation/pages/confirm_code_view.dart';
import 'package:ayol_uchun_exam/features/auth/presentation/pages/enter_phone_number_view.dart';
import 'package:ayol_uchun_exam/features/auth/presentation/pages/login_view.dart';
import 'package:ayol_uchun_exam/features/auth/presentation/pages/sign_up_view.dart';
import 'package:ayol_uchun_exam/features/courses/presentation/pages/courses_view.dart';
import 'package:ayol_uchun_exam/features/home/presentation/manager/home_bloc.dart';
import 'package:ayol_uchun_exam/features/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../data/repositories/course_repository.dart';
import '../../main.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginBloc(repo: context.read()),
        child: LoginView(),
      ),
    ),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpView()),
    GoRoute(
      path: Routes.confirmCode,
      builder: (context, state) => ConfirmCodeView(),
    ),
    GoRoute(
      path: Routes.enterPhoneNum,
      builder: (context, state) => EnterPhoneNumberView(),
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(repo: context.read<CourseRepository>()),
          child: Scaffold(
            body: child,
          ),
        );
      },
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) => HomeView(),
        ),
        GoRoute(
          path: Routes.courses,
          builder: (context, state) => CoursesPage(),
        ),
      ],
    ),
  ],
);
