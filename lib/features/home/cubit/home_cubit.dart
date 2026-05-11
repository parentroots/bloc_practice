import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void onNameChanged(String name) {
    emit(HomeState(
      email: state.email,
        userName: name));
  }
  void onEmailChanged(String email) {
    emit(HomeState(
      userName: state.userName,
        email: email));
  }
}