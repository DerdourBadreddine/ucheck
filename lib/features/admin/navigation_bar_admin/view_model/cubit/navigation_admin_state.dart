part of 'navigation_admin_cubit.dart';

@immutable
abstract class NavigationAdminState {
  Object? get currentIndex;
}

class NavigationAdminInitial extends NavigationAdminState {
  @override
  final int currentIndex;
  final List<Widget> pages;
  NavigationAdminInitial(this.currentIndex, this.pages);

  Widget get currentPage => pages[currentIndex];
}
