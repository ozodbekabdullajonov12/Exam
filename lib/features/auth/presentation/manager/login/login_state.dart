import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';
enum LoginStatus { idle, success, error }
@freezed
abstract class LoginState with  _$LoginState{
  const factory LoginState({
    required bool showPassword,
    required  LoginStatus loginStatus,
    required String? emailSuffix
  }) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      showPassword: true,
      loginStatus: LoginStatus.idle,
      emailSuffix: null,
    );
  }
}