import 'package:bloc_http_api/userModel/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

//loading the data
class userLoadingState extends UserState {
  List<Object?> get props => [];
}

//data loaded
class userLoadedState extends UserState {
  userLoadedState(this.users);
  final List<UserModel> users;
  List<Object?> get props => [users];
}

class dataErrorState extends UserState {
  dataErrorState(this.error);
  final String error;
  List<Object?> get props => [error];
}
