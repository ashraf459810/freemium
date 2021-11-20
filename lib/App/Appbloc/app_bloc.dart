import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freemium/Data/Repository/IRepository.dart';

import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial());
  IRepository iRepository;
  
  

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    
  }
}
