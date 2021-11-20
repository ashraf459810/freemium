part of 'getloation_bloc.dart';

@immutable
abstract class GetloationState {}

class GetloationInitial extends GetloationState {}

class LocationState extends GetloationState {
  final Position position;
  LocationState(this.position);
}

class Error extends GetloationState {
  final String error;
  Error(this.error);
}
class Loading extends GetloationState{
  
}