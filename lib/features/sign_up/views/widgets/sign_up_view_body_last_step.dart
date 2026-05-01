// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  String? _selectedRole = 'student';
  String? _selectedTeacherRole = 'normal';
  String? _selectedStudentLevel = 'L1 info';
  final List<String> _levels = [
    'L1 info',
    'L2 info',
    'L3 info si',
    'L3 info isil',
    'M1 glaa',
    'M2 glaa',
    'M1 res',
    'M2 res',
    'M1 si',
    'M2 si',
    'M1 siaa',
    'M2 siaa',
    'M1 ai',
    'M2 ai'
  ];

  Future<Map<String, dynamic>> fetchUserData() async {
    final userData = await supabase
        .from('users')
        .select('user_role')
        .eq('id', supabase.auth.currentUser!.id)
        .single();
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
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
                      child: Text(
                        'One \n last Step',
                        style: Styles.textStyle46,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 37,
                            height: 37,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff01B836),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff01B836).withValues(alpha: 0.3),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.check_outlined,
                              color: Colors.white,
                            )),
                          ),
                          const SizedBox(height: 6),
                          Text('Step 1', style: Styles.textStyle14),
                        ],
                      ),
                      const SizedBox(width: 13),
                      Column(
                        children: [
                          Container(
                            width: 170,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff01B836),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      const SizedBox(width: 13),
                      Column(
                        children: [
                          Container(
                            width: 37,
                            height: 37,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xff1145FF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff1145FF).withValues(alpha: 0.3),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: const Offset(0, 0),
                                  ),
                                ]),
                            child: Center(
                                child: Text('2', style: Styles.textStyle20)),
                          ),
                          const SizedBox(height: 6),
                          Text('Step 2', style: Styles.textStyle14),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Are you a :', style: Styles.textStyle14),
                      RadioGroup<String>(
                        groupValue: _selectedRole,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedRole = value;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                        myCustomTextFormField(
                          _idNumberController,
                          'ID number',
                          TextInputType.text,
                          false,
                        ),
                        const SizedBox(height: 11),
                        myCustomTextFormField(
                          _passwordController,
                          'Password',
                          TextInputType.text,
                          true,
                        ),
                        const SizedBox(height: 11),
                        myCustomTextFormField(
                          _confirmPasswordController,
                          'Confirm Password',
                          TextInputType.text,
                          true,
                        ),
                        const SizedBox(height: 11),
                        _selectedRole == 'student'
                            ? PopupMenuButton(
                                onSelected: (value) {
                                  _selectedStudentLevel = value;
                                  setState(() {});
                                },
                                initialValue: '$_selectedStudentLevel',
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: const Color(0xffE1DFEC),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child:
                                                Text('$_selectedStudentLevel')),
                                        const Icon(Icons.arrow_drop_down),
                                      ],
                                    ),
                                  ),
                                ),
                                itemBuilder: (context) => _levels
                                    .map((level) => PopupMenuItem(
                                          value: level,
                                          child: Text(level),
                                        ))
                                    .toList(),
                              )
                            : RadioGroup<String>(
                                groupValue: _selectedTeacherRole,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedTeacherRole = value;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Radio<String>(value: 'normal'),
                                    Text('Normal', style: Styles.textStyle14),
                                    const Radio<String>(value: 'principal'),
                                    Text('Principal', style: Styles.textStyle14),
                                  ],
                                ),
                              ),
                        const SizedBox(height: 39),
                        Container(
                          width: double.infinity,
                          height: 49,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(47),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff1145FF).withValues(alpha: 0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                )
                              ]),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff1145FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(47),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  _passwordController.text ==
                                      _confirmPasswordController.text) {
                                setState(() {
                                  _isLoading = true;
                                });
                                try {
                                  await supabase.auth.signUp(
                                    email: widget.email,
                                    password: _passwordController.text,
                                  );

                                  await supabase.from('users').insert({
                                    'id': supabase.auth.currentUser!.id,
                                    'name': widget.name,
                                    'last_name': widget.lastName,
                                    'email': widget.email,
                                    'id_number': _idNumberController.text,
                                    'user_role': _selectedRole,
                                    'user_categorie': _selectedRole == 'student'
                                        ? _selectedStudentLevel
                                        : _selectedTeacherRole
                                  });
                                  final userData = await fetchUserData();
                                  if (userData['user_role'] == 'student') {
                                    if (!context.mounted) return;
                                    GoRouter.of(context).pushReplacement(
                                        AppRouter.kNavigationBar);
                                  } else if (userData['user_role'] ==
                                      'teacher') {
                                    if (!context.mounted) return;
                                    GoRouter.of(context).pushReplacement(
                                        AppRouter.kNavigationBarAdmin);
                                  } else {
                                    return;
                                  }
                                } catch (error) {
                                  if (!context.mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Registration failed please check your internet!')));
                                } finally {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              } else if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Center(
                                          child:
                                              Text('passwords do not match!'))),
                                );
                              }
                            },
                            child: Text(
                              'Finish',
                              style: Styles.textStyle14
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (_isLoading)
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withValues(alpha: 0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }

  TextFormField myCustomTextFormField(
    TextEditingController controller,
    String hintText,
    TextInputType inputType,
    bool obscureText,
  ) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill this field';
        }
        return null;
      },
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: (hintText),
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
      ),
      keyboardType: inputType,
    );
  }
}
