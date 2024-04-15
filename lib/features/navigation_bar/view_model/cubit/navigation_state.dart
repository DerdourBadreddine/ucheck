part of 'navigation_cubit.dart';
@immutable
abstract class NavigationState {
  Object? get currentIndex;

}

class NavigationInitial extends NavigationState {
  @override
  final int currentIndex;
  final List<Widget> pages;
  NavigationInitial(this.currentIndex, this.pages);

  Widget get currentPage => pages[currentIndex]; 
}
