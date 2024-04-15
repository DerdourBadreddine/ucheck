import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ucheck/features/home/views/home_view.dart';
import 'package:ucheck/features/sign_in/views/sign_in.dart';
import 'package:ucheck/features/sign_up/views/sign_up_view.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationInitial(0, const [
          SignIn(),
          HomeView(),
          SignUpView(),
        ]));
  void updateIndex(int index) {
    emit(NavigationInitial(index, (state as NavigationInitial).pages));
  }
}
