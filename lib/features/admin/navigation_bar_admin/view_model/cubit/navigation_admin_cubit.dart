import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ucheck/features/admin/calendar_admin/views/calendar_admin_view.dart';
import 'package:ucheck/features/admin/home/views/home_view.dart';
import 'package:ucheck/features/admin/student_list/views/student_list_view.dart';
import 'package:ucheck/features/profile/profile_view.dart';
part 'navigation_admin_state.dart';

class NavigationAdminCubit extends Cubit<NavigationAdminState> {
  NavigationAdminCubit()
      : super(NavigationAdminInitial(0, const [
          MyCalendarAdminView(),
          HomeAdminView(),
          StudentListView(),
          ProfileView(),
        ]));
  void updateIndex(int index) {
    emit(
        NavigationAdminInitial(index, (state as NavigationAdminInitial).pages));
  }
}
