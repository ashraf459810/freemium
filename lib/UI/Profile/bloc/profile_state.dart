part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileUpdateState extends ProfileState {
  final UpdateProfile updateProfile;

  GetProfileUpdateState(this.updateProfile);
}

class Loading extends ProfileState {}

class Error extends ProfileState {
  final String error;

  Error(this.error);
}
