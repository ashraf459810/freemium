import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
part 'getloation_event.dart';
part 'getloation_state.dart';

class GetloationBloc extends Bloc<GetloationEvent, GetloationState> {
  GetloationBloc() : super(GetloationInitial());
  Position position;
  
  @override
  Stream<GetloationState> mapEventToState(
    GetloationEvent event,
  ) async* {
    if (event is GetloationEvent) {
      yield Loading();
      await Permission.location.isGranted;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // position = await functions.determinePosition();
      print("here the postion $position");
      if (position == null) {
        yield Error("There is a problem with gettin your location");
      } else
        yield LocationState(position);
    }
  }
}
