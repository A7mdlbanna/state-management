import 'package:bloc/bloc.dart';

class Counter2Cubit extends Cubit<int>{
  Counter2Cubit() : super(0);

  void increase() => emit(state + 1);

}