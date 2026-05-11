import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(count: 0));



  void decrement() {
    emit(CounterState(count: state.count - 1));
    debugPrint('Count: ${state.count}');
  }

  void increment(){
    emit(CounterState(count: state.count+1));
    debugPrint('Count: ${state.count}');
  }

  void resetCount(){
    emit(CounterState(count: 0));
    debugPrint('Count: ${state.count}');
  }

}