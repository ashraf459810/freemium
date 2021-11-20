import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freemium/Data/Repository/IRepository.dart';
import 'package:freemium/Model/UpdateProfile.dart';

import 'package:meta/meta.dart';

import '../../../injection.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());
  var repo = sl.get<IRepository>();
  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfileUpdateEvent) {
      yield Loading();
      try {
        var token = await repo.iprefsHelper.getToken();
        if (event.isupdate == true) {
          UpdateProfile response = await repo.getrequest(
              ([response]) => updateProfileFromJson(response),
              "/User/Update?api_token=$token&name=${event.name ?? ""}&email=${event.email ?? ""}&phone=${event.mobile ?? ""}&birthDate=${event.birth ?? ""}&address=${event.address ?? ""}&gender=${event.gender ?? ""}");
          yield GetProfileUpdateState(response);
        } else {
          UpdateProfile response2 = await repo.getrequest(
              ([response]) => updateProfileFromJson(response),
              "/User/Update?api_token=$token");
          yield GetProfileUpdateState(response2);
        }
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }
}
