import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ucheck/core/utils/app_router.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';

class SignUpViewbody extends StatefulWidget {
  const SignUpViewbody({super.key});

  @override
  State<SignUpViewbody> createState() => _SignUpViewbodyState();
}

class _SignUpViewbodyState extends State<SignUpViewbody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsData.imgBgSignUp),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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
                        color: const Color(0xff1145FF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff1145FF).withValues(alpha: 0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: Styles.textStyle20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Step 1',
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 13,
                ),
                Column(
                  children: [
                    Container(
                      width: 170,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xffD9D9D9),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 13,
                ),
                Column(
                  children: [
                    Container(
                      width: 37,
                      height: 37,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffD9D9D9),
                      ),
                      child: Center(
                          child: Text(
                        '2',
                        style: Styles.textStyle20,
                      )),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Step 2',
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  myCustomTextFormField(
                    _nameController,
                    'Name',
                    TextInputType.text,
                    false,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  myCustomTextFormField(
                    _lastNameController,
                    'Last name',
                    TextInputType.text,
                    false,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  myCustomTextFormField(
                    _emailController,
                    'Email',
                    TextInputType.emailAddress,
                    false,
                  ),
                  const SizedBox(
                    height: 39,
                  ),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final String name = _nameController.text;
                          final String lastName = _lastNameController.text;
                          final String email = _emailController.text;
                          GoRouter.of(context).push(
                            AppRouter.kRegistrationLastStep,
                            extra: <String, String?>{
                              'name': name,
                              'lastName': lastName,
                              'email': email,
                            },
                          );
                        }
                      },
                      child: Text(
                        'Next',
                        style: Styles.textStyle14.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Already have an account ?',
                          style: Styles.textStyle14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: Text(
                            'Sign in now',
                            style: Styles.textStyle14
                                .copyWith(color: const Color(0xff1145FF)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  TextFormField myCustomTextFormField(TextEditingController controller,
      String hintText, TextInputType inputType, bool obscureText) {
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
          borderSide: const BorderSide(
            color: Color(0xffE1DFEC),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffE1DFEC),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: inputType,
    );
  }
}
