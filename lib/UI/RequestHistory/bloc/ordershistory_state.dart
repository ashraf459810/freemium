part of 'ordershistory_bloc.dart';

@immutable
abstract class OrdershistoryState {}

class OrdershistoryInitial extends OrdershistoryState {}

class GetRequestHistoryState extends OrdershistoryState {
  final RequestHistory requestHistory;

  GetRequestHistoryState(this.requestHistory);
}

class Error extends OrdershistoryState {
  final String error;

  Error(this.error);
}

class Loading extends OrdershistoryState {}
