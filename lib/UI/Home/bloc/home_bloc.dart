import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freemium/Data/Repository/IRepository.dart';
import 'package:freemium/Model/Services/Services.dart';

import 'package:meta/meta.dart';

import '../../../injection.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  var repository = sl.get<IRepository>();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetServicesEvent) {
      yield Loading();
      try {
        var services = await repository.getrequest(
            ([response]) => servicesFromJson(response),
            "/Communities/${event.coummnityid}");
        yield GetServicesState(services);
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }
}
