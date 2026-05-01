import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ucheck/core/utils/app_router.dart';
import 'package:ucheck/features/sign_in/views/sign_in.dart';
import 'package:ucheck/main.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final session = supabase.auth.currentSession;
    if (session == null) return;
    try {
      final data = await supabase
          .from('users')
          .select('user_role')
          .eq('id', session.user.id)
          .maybeSingle();
      if (!mounted || data == null) return;
      final role = data['user_role'] as String?;
      if (role == 'student') {
        context.pushReplacement(AppRouter.kNavigationBar);
      } else if (role == 'teacher') {
        context.pushReplacement(AppRouter.kNavigationBarAdmin);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) => const SignIn();
}
