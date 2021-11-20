import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freemium/Data/Repository/IRepository.dart';

import 'package:freemium/Model/Token.dart';

import 'package:meta/meta.dart';

import '../../../injection.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  var repository = sl.get<IRepository>();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is GetLoginEvent) {
      yield GetLoadingLogin();
      try {
        Token token = await repository.getrequest(
            ([response]) => tokenFromJson(response),
            "/GetToken/${event.nameormobile}/${event.password}");
        print(token.apiToken);
        await repository.iprefsHelper.savetoken(token.apiToken);
        yield GetLoginState(token);
      } catch (error) {
        yield GetErrorLogin(error.toString());
      }
    }
  }
}
