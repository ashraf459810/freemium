import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freemium/Data/Repository/IRepository.dart';
import 'package:freemium/Model/RequestHistory/RequestHistory.dart';
import 'package:meta/meta.dart';

import '../../../injection.dart';

part 'ordershistory_event.dart';
part 'ordershistory_state.dart';

class OrdershistoryBloc extends Bloc<OrdershistoryEvent, OrdershistoryState> {
  OrdershistoryBloc() : super(OrdershistoryInitial());
  var repo = sl.get<IRepository>();

  @override
  Stream<OrdershistoryState> mapEventToState(
    OrdershistoryEvent event,
  ) async* {
    if (event is GetRequestHistoryEvent) {
      print("here from bloc");
      yield Loading();
      try {
        var token = await repo.iprefsHelper.getToken();
        var requestHistory = await repo.getrequest(
            ([response]) => requestHistoryFromJson(response),
            "/Orders?api_token=$token");
        yield GetRequestHistoryState(requestHistory);
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }
}
