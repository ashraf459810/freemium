part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class AuthState extends HomeState {
  final String uuid;
  AuthState(this.uuid);
}

class GetServicesState extends HomeState {
  final Services services;

  GetServicesState(this.services);
}

class Loading extends HomeState {}

class Error extends HomeState {
  final String error;

  Error(this.error);
}
