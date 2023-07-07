import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

//loading the data
class userLoadingState extends UserState {
  List<Object?> get props => [];
}

//data loaded

class userLoadedState extends UserState {
  List<Object?> get props => [];
}

class dataErrorState extends UserState {
  List<Object?> get props => [];
}
