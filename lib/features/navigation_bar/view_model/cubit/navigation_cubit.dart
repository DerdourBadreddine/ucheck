import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ucheck/features/calendar/views/calendar_view.dart';
import 'package:ucheck/features/home/views/home_view.dart';
import 'package:ucheck/features/profile/profile_view.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationInitial(0, const [
          MyCalendarView(),
          HomeView(),
          ProfileView(),
        ]));
  void updateIndex(int index) {
    emit(NavigationInitial(index, (state as NavigationInitial).pages));
  }
}
