import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ucheck/features/admin/home/views/home_view.dart';
import 'package:ucheck/features/profile/profile_view.dart';
import 'package:ucheck/features/sign_in/views/sign_in.dart';
part 'navigation_admin_state.dart';

class NavigationAdminCubit extends Cubit<NavigationAdminState> {
  NavigationAdminCubit()
      : super(NavigationAdminInitial(0, const [
          SignIn(),
          HomeAdminView(),
          ProfileView(),
        ]));
  void updateIndex(int index) {
    emit(
        NavigationAdminInitial(index, (state as NavigationAdminInitial).pages));
  }
}
