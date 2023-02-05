import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:state_managment_ex/cubit/observer.dart';

import 'app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}