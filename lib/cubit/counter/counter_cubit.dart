import 'package:bloc/bloc.dart';

import 'counter_states.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(InitialState());

  int count = 0;
  void increase() {
    count++;
    emit(IncreaseCounter());
  }
  void decrease() {
    count--;
    emit(DecreaseCounter());
  }

}