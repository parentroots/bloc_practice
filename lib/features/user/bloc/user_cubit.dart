import 'package:bloc_practice/features/user/bloc/user_state.dart';
import 'package:bloc_practice/features/user/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  Future<void> fetchUser() async {

    emit(UserLoadingState());

    try {
      final url = Uri.parse(
        "https://jsonplaceholder.typicode.com/users/1",
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final user = UserModel.fromJson(data);

        emit(UserFetchSuccessState(user: user));

      } else {
        emit(UserFetchFailureState(message: "Server Error"));
      }
    } catch (e) {
      emit(UserFetchFailureState(message: e.toString()));
    }
  }

  void reset() {
    emit(UserInitialState());
  }
}