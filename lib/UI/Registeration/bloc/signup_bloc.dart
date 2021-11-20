import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freemium/Data/Repository/IRepository.dart';

import 'package:freemium/Model/CheckCode/CodeCheck.dart';
import 'package:freemium/Model/Communities/Communities.dart';
import 'package:freemium/Model/Success/Success.dart';

import 'package:meta/meta.dart';

import '../../../injection.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial());
  var repo = sl.get<IRepository>();
  String aptnum;
  String aptfloornum;
  String aptbuildingid;
  String name;
  String phonenumber;
  String password;
  String cityid;
  String email;
  String gender;
  String birhdate;
  String address;

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is GetCommunitiesEvent) {
      yield GetLoading();

      try {
        var community = await repo.getrequest(
            ([response]) => communityFromJson(response), "/Communities");
        yield GetCommunitiesState(community);
      } catch (error) {
        yield GetError(error.toString());
      }
    }
    if (event is CodeCheckEvent) {
      yield GetLoading();

      try {
        var codecheck = await repo.getrequest(
            ([response]) => codeCheckFromJson(response),
            "/VerifyAccount/${event.number}/${event.code}");
        yield CodeCheckState(codecheck);
      } catch (error) {
        yield GetError("Wrong code");
      }
    }
    if (event is GetSignUpEvent) {
      print("here the phone from register $phonenumber");
      yield GetLoading();

      try {
        var signresponse = await repo.getrequest(
            ([response]) => successfromjson(response),
            "/Register?aptNumber=${event.aptnum}&aptFloorNumber=${event.aptfloornum}&aptBuildingsID=${event.aptbuildingid}&name=$name&phone=$phonenumber&password=$password&cities_id=&email=$email&genders_id=$gender&birthDate=$birhdate&address=");
        yield GetSignUpState(signresponse);
      } catch (error) {
        yield GetError(error.toString());
      }
    }
    if (event is SendCodeEvent) {
      yield GetLoading();
      try {
        var success = await repo.getrequest(
            ([response]) => successfromjson(response),
            "/ResendSMS/${event.phone}");
        yield SendCodeState(success);
      } catch (error) {
        yield GetError("Error while sending code");
      }
    }
    if (event is SaveSignUpInfoEvent) {
      aptnum = event.aptnum;
      aptfloornum = event.aptfloornum;
      aptbuildingid = event.aptbuildingid;
      name = event.name;

      password = event.password;
      cityid = event.cityid;
      email = event.email;
      gender = event.gender;
      birhdate = event.birhdate;
      address = event.address;
    }
    if (event is SaveSignUpNumberEvent) {
      phonenumber = event.phone;
    }
  }
}
