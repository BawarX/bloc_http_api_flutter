import 'package:bloc_http_api/blocs/bloc_event.dart';
import 'package:bloc_http_api/blocs/bloc_state.dart';
import 'package:bloc_http_api/repos/repository.dart';
import 'package:bloc_http_api/userModel/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class userBloc extends Bloc<UserEvent, UserState> {
  final userRepository _userRepository;

  userBloc(this._userRepository) : super(userLoadingState()) {
    on<LoadUserEvent>(((event, emit) async {
      emit(userLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(userLoadedState(users));
      } catch (e) {
        emit(dataErrorState(e.toString()));
      }
    }));
  }
}
