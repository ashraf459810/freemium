import 'package:freemium/Data/HTTP_Helper/IHttp_Helper.dart';
import 'package:freemium/Data/Prefs_Helper/IPrefs_Helper.dart';
import 'package:freemium/Data/Repository/IRepository.dart';

import 'package:get_it/get_it.dart';
import 'package:freemium/UI/Address&Map/GetLocationBloc/getloation_bloc.dart';

final sl = GetIt.instance;

Future iniGetIt() async {
  //data

  sl.registerLazySingleton<GetloationBloc>(() => GetloationBloc());
  sl.registerLazySingleton<IprefsHelper>(() => IprefsHelper());
  sl.registerLazySingleton<IHttpHlper>(() => IHttpHlper());
  sl.registerLazySingleton<IRepository>(() => IRepository(sl(), sl()));

  /// AppBloc
}
