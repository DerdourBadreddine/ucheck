// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ucheck/core/utils/app_router.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/main.dart';

class SignUpViewBodyLastStep extends StatefulWidget {
  final String? name;
  final String? lastName;
  final String? email;
  const SignUpViewBodyLastStep({
    super.key,
    this.name,
    this.lastName,
    this.email,
  });

  @override
  State<SignUpViewBodyLastStep> createState() => _SignUpViewBodyLastStepState();
}

class _SignUpViewBodyLastStepState extends State<SignUpViewBodyLastStep> {
  final _idNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _selectedRole = 'student';
  String? _selectedTeacherRole = 'normal';
  String? _selectedStudentLevel = 'L1 info';

  final List<String> _levels = [
    'L1 info', 'L2 info', 'L3 info si', 'L3 info isil',
    'M1 glaa', 'M2 glaa', 'M1 res', 'M2 res',
    'M1 si', 'M2 si', 'M1 siaa', 'M2 siaa', 'M1 ai', 'M2 ai',
  ];

  @override
  void dispose() {
    _idNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String _friendlyError(Object error) {
    if (error is AuthException) {
      final msg = error.message.toLowerCase();
      if (msg.contains('user already registered')) {
        return 'An account with this email already exists.';
      }
      if (msg.contains('password should be at least')) {
        return 'Password must be at least 6 characters.';
      }
      if (msg.contains('unable to validate email')) {
        return 'Please enter a valid email address.';
      }
      if (msg.contains('too many requests')) {
        return 'Too many attempts — please wait a moment.';
      }
      return error.message;
    }
    return 'Registration failed — check your internet connection.';
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Passwords do not match.'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }
    setState(() => _isLoading = true);
    try {
      final categorie = _selectedRole == 'student'
          ? _selectedStudentLevel
          : _selectedTeacherRole;

      // Profile data is stored in user metadata so the DB trigger can
      // insert public.users immediately — works whether email confirmation
      // is enabled or not (trigger fires on auth.users INSERT).
      final response = await supabase.auth.signUp(
        email: widget.email,
        password: _passwordController.text,
        data: {
          'name': widget.name,
          'last_name': widget.lastName,
          'id_number': _idNumberController.text.trim(),
          'user_role': _selectedRole,
          'user_categorie': categorie,
        },
      );

      if (response.user == null) {
        throw Exception('Registration failed — please try again.');
      }

      if (!mounted) return;

      if (response.session == null) {
        // Email confirmation is enabled — profile row is already created by
        // the DB trigger; user just needs to confirm their email.
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Account created! Check your email to confirm before logging in.'),
          duration: Duration(seconds: 6),
          behavior: SnackBarBehavior.floating,
        ));
        context.pushReplacement(AppRouter.kDefault);
        return;
      }

      // Session exists (email confirmation disabled) — route immediately.
      if (_selectedRole == 'student') {
        context.pushReplacement(AppRouter.kNavigationBar);
      } else {
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
    return Scaffold(
      body: AbsorbPointer(
        absorbing: _isLoading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsData.imgBgSignUpLastStep),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 26, bottom: 40),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('One \n last Step', style: Styles.textStyle46),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Step indicator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  children: [
                    _stepCircle(done: true, label: 'Step 1'),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Container(
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xff01B836),
                        ),
                      ),
                    ),
                    const SizedBox(width: 13),
                    _stepCircle(done: false, label: 'Step 2', active: true),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Role picker
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Are you a :', style: Styles.textStyle14),
                    RadioGroup<String>(
                      groupValue: _selectedRole,
                      onChanged: (v) => setState(() => _selectedRole = v),
                      child: Row(
                        children: [
                          const Radio<String>(value: 'student'),
                          Text('Student', style: Styles.textStyle14),
                          const Radio<String>(value: 'teacher'),
                          Text('Teacher', style: Styles.textStyle14),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      _buildField(_idNumberController, 'ID number',
                          TextInputType.text, false),
                      const SizedBox(height: 11),
                      _buildField(_passwordController, 'Password',
                          TextInputType.text, true),
                      const SizedBox(height: 11),
                      _buildField(_confirmPasswordController, 'Confirm Password',
                          TextInputType.text, true),
                      const SizedBox(height: 11),
                      if (_selectedRole == 'student')
                        _levelPicker()
                      else
                        RadioGroup<String>(
                          groupValue: _selectedTeacherRole,
                          onChanged: (v) =>
                              setState(() => _selectedTeacherRole = v),
                          child: Row(
                            children: [
                              const Radio<String>(value: 'normal'),
                              Text('Normal', style: Styles.textStyle14),
                              const Radio<String>(value: 'principal'),
                              Text('Principal', style: Styles.textStyle14),
                            ],
                          ),
                        ),
                      const SizedBox(height: 39),
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
                          onPressed: _isLoading ? null : _register,
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
                                  'Finish',
                                  style: Styles.textStyle14
                                      .copyWith(color: Colors.white),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepCircle({required bool done, required String label, bool active = false}) {
    return Column(
      children: [
        Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: done
                ? const Color(0xff01B836)
                : active
                    ? const Color(0xff1145FF)
                    : const Color(0xffD9D9D9),
            boxShadow: [
              if (done || active)
                BoxShadow(
                  color: (done ? const Color(0xff01B836) : const Color(0xff1145FF))
                      .withValues(alpha: 0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                ),
            ],
          ),
          child: Center(
            child: done
                ? const Icon(Icons.check_outlined, color: Colors.white, size: 18)
                : Text(active ? '2' : '2', style: Styles.textStyle20),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: Styles.textStyle14),
      ],
    );
  }

  Widget _levelPicker() {
    return PopupMenuButton<String>(
      onSelected: (v) => setState(() => _selectedStudentLevel = v),
      initialValue: _selectedStudentLevel,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffE1DFEC)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(child: Text('$_selectedStudentLevel')),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      itemBuilder: (_) => _levels
          .map((l) => PopupMenuItem(value: l, child: Text(l)))
          .toList(),
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
