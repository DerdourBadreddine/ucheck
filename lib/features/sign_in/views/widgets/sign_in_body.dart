import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ucheck/core/utils/app_router.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/main.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _friendlyError(Object error) {
    if (error is AuthException) {
      final msg = error.message.toLowerCase();
      if (msg.contains('invalid login credentials')) {
        return 'Incorrect email or password.';
      }
      if (msg.contains('email not confirmed')) {
        return 'Please confirm your email before logging in.';
      }
      if (msg.contains('too many requests')) {
        return 'Too many attempts — please wait a moment and try again.';
      }
      return error.message;
    }
    return 'Connection error — check your internet connection.';
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      await supabase.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      final userData = await supabase
          .from('users')
          .select('user_role')
          .eq('id', supabase.auth.currentUser!.id)
          .single();
      if (!mounted) return;
      final role = userData['user_role'] as String?;
      if (role == 'student') {
        context.pushReplacement(AppRouter.kNavigationBar);
      } else if (role == 'teacher') {
        context.pushReplacement(AppRouter.kNavigationBarAdmin);
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_friendlyError(error)),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
      ));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: _isLoading,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsData.imgBgSignIn),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 325),
                    Text(
                      'Welcome !',
                      style: TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'make your exams less frustrating',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 55),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    _buildField(_emailController, 'Email',
                        TextInputType.emailAddress, false),
                    const SizedBox(height: 10),
                    _buildField(_passwordController, 'Password',
                        TextInputType.text, true),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget Password ?',
                        style: Styles.textStyle14
                            .copyWith(color: const Color(0xff5174DB)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 49,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1145FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(47),
                          ),
                        ),
                        onPressed: _isLoading ? null : _signIn,
                        child: _isLoading
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Log in',
                                style: Styles.textStyle14
                                    .copyWith(color: Colors.white),
                              ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text('Not registered yet ?',
                              style: Styles.textStyle14),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () =>
                                context.push(AppRouter.kRegistration),
                            child: Text(
                              'Create an account',
                              style: Styles.textStyle14.copyWith(
                                  color: const Color(0xff1145FF)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildField(
    TextEditingController controller,
    String hint,
    TextInputType inputType,
    bool obscure,
  ) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: inputType,
      cursorColor: Colors.grey,
      validator: (v) =>
          (v == null || v.isEmpty) ? 'Please fill this field' : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Styles.textStyle14,
        contentPadding: const EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE1DFEC)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE1DFEC)),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
