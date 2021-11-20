part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class AuthEvent extends HomeEvent {}

class GetServicesEvent extends HomeEvent {
  final String coummnityid;

  GetServicesEvent(this.coummnityid);
}
