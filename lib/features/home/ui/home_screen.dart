import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../../counter/ui/counter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Home Screen');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CounterScreen()),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,

        title: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocProvider(
          create: (context) => HomeCubit(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Edit your personal information",
                    style: TextStyle(fontSize: 24),
                  ),

                  SizedBox(height: 20),
                  TextField(
                    decoration: buildInputDecoration("Enter Your Name"),
                    onChanged: (value) {
                      context.read<HomeCubit>().onNameChanged(value);
                    },
                  ),

                  Text("${state.userName}"),

                  SizedBox(height: 20),
                  TextField(
                    decoration: buildInputDecoration("Enter Your Email"),
                    onChanged: (value) {
                      context.read<HomeCubit>().onEmailChanged(value);
                    },
                  ),

                  Text("${state.email}"),
                  SizedBox(height: 20),
                  TextField(
                    decoration: buildInputDecoration("Enter Your Phone Number"),
                  ),
                  SizedBox(height: 20),
                  TextField(decoration: buildInputDecoration("Enter Address")),
                  SizedBox(height: 20),
                  TextField(decoration: buildInputDecoration("Enter Password")),
                  SizedBox(height: 20),
                  TextField(
                    decoration: buildInputDecoration("Enter Confirm Password"),
                  ),
                  SizedBox(height: 20),

                  InkWell(
                    onTap: () {
                      onTapSubmitButton(context);
                    },
                    child: Container(
                      height: 52,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CounterScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 52),
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Go to Counter"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void onTapSubmitButton(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Data Submitted')));
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      hintText: hintText,
    );
  }
}
