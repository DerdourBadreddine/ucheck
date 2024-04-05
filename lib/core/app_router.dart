import 'package:go_router/go_router.dart';
import 'package:ucheck/features/sign_in/views/sign_in.dart';
import 'package:ucheck/features/sign_up/views/sign_up_view.dart';

abstract class Routes {
  static const kSignIn = '/signIn';
  static const kRegistration = '/signUp';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: kRegistration,
      builder: (context, state) => const SignUpView(),
    )
  ]);
}
