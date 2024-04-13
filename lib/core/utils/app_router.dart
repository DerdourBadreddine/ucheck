import 'package:go_router/go_router.dart';
import 'package:ucheck/features/home/views/home_view.dart';
import 'package:ucheck/features/navigation_bar/views/navigation_bar_view.dart';
import 'package:ucheck/features/sign_in/views/sign_in.dart';
import 'package:ucheck/features/sign_up/views/sign_up_view.dart';
import 'package:ucheck/features/sign_up/views/widgets/sign_up_view_body_last_step.dart';

abstract class AppRouter {
  static const kSignIn = '/signIn';
  static const kRegistration = '/signUp';
  static const kRegistrationLastStep = '/signUpLastStep';
  static const kNavigationBar = '/NavigationBar';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: kRegistration,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: '$kRegistrationLastStep/:name/:lastName/:email',
      name: kRegistrationLastStep,
      builder: (context, state) => SignUpViewBodyLastStep(
        name: state.pathParameters['name'],
        lastName: state.pathParameters['lastName'],
        email: state.pathParameters['email'],
      ),
    ),
    GoRoute(
      path: kNavigationBar,
      builder: (context, state) => const NavigationBarView(),
    ),
  ]);
}
