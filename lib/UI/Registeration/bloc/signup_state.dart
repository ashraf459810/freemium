part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class GetCommunitiesState extends SignupState {
  final Community community;

  GetCommunitiesState(this.community);
}

class GetError extends SignupState {
  final String error;

  GetError(this.error);
}

class GetLoading extends SignupState {}

class CodeCheckState extends SignupState {
  final CodeCheck check;

  CodeCheckState(this.check);
}

class GetSignUpState extends SignupState {
  final Success success;

  GetSignUpState(this.success);
}

class SendCodeState extends SignupState {
  final Success success;

  SendCodeState(this.success);
}
