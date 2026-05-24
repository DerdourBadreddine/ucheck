import 'package:go_router/go_router.dart';
import 'package:ucheck/core/utils/auth_gate.dart';
import 'package:ucheck/features/admin/calendar_admin/widgets/exam_form_view.dart';
import 'package:ucheck/features/admin/navigation_bar_admin/views/navigation_bar_view.dart';
import 'package:ucheck/features/navigation_bar/views/navigation_bar_view.dart';
import 'package:ucheck/features/sign_up/views/sign_up_view.dart';
import 'package:ucheck/features/sign_up/views/widgets/sign_up_view_body_last_step.dart';

abstract class AppRouter {
  static const kDefault = '/';
  static const kRegistration = '/signUp';
  static const kRegistrationLastStep = '/signUpLastStep';
  static const kNavigationBar = '/NavigationBar';
  static const kNavigationBarAdmin = '/NavigationBarAdmin';
  static const kFormExam = '/formExamAdmin';

  static final router = GoRouter(routes: [
    GoRoute(
      path: kDefault,
      builder: (context, state) => const AuthGate(),
    ),
    GoRoute(
      path: kRegistration,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: kRegistrationLastStep,
      builder: (context, state) {
        final extra = state.extra as Map<String, String?>? ?? {};
        return SignUpViewBodyLastStep(
          name: extra['name'],
          lastName: extra['lastName'],
          email: extra['email'],
        );
      },
    ),
    GoRoute(
      path: kNavigationBar,
      builder: (context, state) => const NavigationBarView(),
    ),
    GoRoute(
      path: kNavigationBarAdmin,
      builder: (context, state) => const NavigationBarAdminView(),
    ),
    GoRoute(
      path: kFormExam,
      builder: (context, state) => const ExamFormView(),
    ),
  ]);
}
