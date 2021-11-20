part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileUpdateEvent extends ProfileEvent {
  final String name;
  final String birth;
  final String gender;
  final String mobile;
  final String email;
  final String address;
  final bool isupdate;

  GetProfileUpdateEvent(
      {this.name,
      this.birth,
      this.gender,
      this.mobile,
      this.email,
      this.address,
      this.isupdate});
}
