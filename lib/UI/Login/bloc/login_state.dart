part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class GetLoginState extends LoginState {
  final Token token;

  GetLoginState(this.token);
}

class GetLoadingLogin extends LoginState {}

class GetErrorLogin extends LoginState {
  final String error;

  GetErrorLogin(this.error);
}
