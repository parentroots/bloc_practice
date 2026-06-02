import 'package:bloc_practice/features/user/data/model/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserFetchSuccessState extends UserState {
  final UserModel user;


  UserFetchSuccessState({required this.user});
}

class UserFetchFailureState extends UserState {
  final String message;

  UserFetchFailureState({required this.message});
}