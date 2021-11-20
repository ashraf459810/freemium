part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class GetCommunitiesEvent extends SignupEvent {}

class CodeCheckEvent extends SignupEvent {
  final String number;
  final String code;
  CodeCheckEvent(this.code, this.number);
}

class GetSignUpEvent extends SignupEvent {
  final String aptnum;
  final String aptfloornum;
  final String aptbuildingid;

  GetSignUpEvent(
    this.aptnum,
    this.aptfloornum,
    this.aptbuildingid,
  );
}

class SendCodeEvent extends SignupEvent {
  final String phone;

  SendCodeEvent(this.phone);
}

class SaveSignUpInfoEvent extends SignupEvent {
  final String aptnum;
  final String aptfloornum;
  final String aptbuildingid;
  final String name;

  final String password;
  final String cityid;
  final String email;
  final String gender;
  final String birhdate;
  final String address;

  SaveSignUpInfoEvent(
      {this.aptnum,
      this.aptfloornum,
      this.aptbuildingid,
      this.name,
      this.password,
      this.cityid,
      this.email,
      this.gender,
      this.birhdate,
      this.address});
}

class SaveSignUpNumberEvent extends SignupEvent {
  final String phone;

  SaveSignUpNumberEvent(this.phone);
}
