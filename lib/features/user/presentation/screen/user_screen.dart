import 'package:bloc_practice/features/user/bloc/user_cubit.dart';
import 'package:bloc_practice/features/user/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserCubit()..fetchUser(),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserFetchSuccessState) {
              return ListView.builder(

                itemCount: 10,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ID: ${state.user.id}"),
                        Text("Name: ${state.user.name}"),
                        Text("Email: ${state.user.email}"),
                      ],
                    ),
                  );
                },
              );
            }

            if (state is UserFetchFailureState) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
