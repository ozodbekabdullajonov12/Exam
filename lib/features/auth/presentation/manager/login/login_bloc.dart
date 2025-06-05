import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../data/repositories/auth_repository.dart';
import '../../../../../main.dart';
import 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repo;
  final phoneNumController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginBloc({required AuthRepository repo})
    : _repo = repo,
      super(LoginState.initial()) {
    on<LoginUser>(_login);
    on<ShowPassword>(_showPassword);
  }

  Future _login(LoginUser event, Emitter emit) async {
      bool result = await _repo.login(
        phoneNumber: '+998${phoneNumController.text}',
        password: passwordController.text,
      );
      if (result) {
        navigatorKey.currentContext!.go(Routes.home);
        emit(state.copyWith(loginStatus: LoginStatus.success));
      } else {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.error,
          ),
        );
      }
  }


  Future _showPassword(ShowPassword event, Emitter emit) async {
    emit(state.copyWith(showPassword: !state.showPassword));
  }


}
