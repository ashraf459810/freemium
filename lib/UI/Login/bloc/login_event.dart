part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class GetLoginEvent extends LoginEvent {
  final String nameormobile;
  final String password;
  GetLoginEvent(this.nameormobile, this.password);
}
