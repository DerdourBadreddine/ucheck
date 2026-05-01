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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

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
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetsData.imgBgSignIn),
                        fit: BoxFit.fill)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 325),
                      Text(
                        "Welcome !",
                        style: TextStyle(
                            fontSize: 54,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "make your exams less frustrating",
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
                      myCustomTextFormField(_emailController, 'Email',
                          TextInputType.emailAddress, false),
                      const SizedBox(height: 10),
                      myCustomTextFormField(_passwordController, 'Password',
                          TextInputType.text, true),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Forget Password ?',
                            style: Styles.textStyle14
                                .copyWith(color: const Color(0xff5174DB)),
                          ),
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                await supabase.auth.signInWithPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                final userData = await fetchUserData();
                                if (userData['user_role'] == 'student') {
                                  if (!context.mounted) return;
                                  GoRouter.of(context).pushReplacement(
                                      AppRouter.kNavigationBar);
                                } else if (userData['user_role'] == 'teacher') {
                                  if (!context.mounted) return;
                                  GoRouter.of(context).pushReplacement(
                                      AppRouter.kNavigationBarAdmin);
                                } else {
                                  return;
                                }
                              } on AuthException catch (error) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(error.message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } catch (error) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Login failed! Please check your credentials or your internet connection.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } finally {
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            }
                          },
                          child: Text(
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
                            Text(
                              'Not registred yet ?',
                              style: Styles.textStyle14,
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kRegistration);
                              },
                              child: Text(
                                'create an account',
                                style: Styles.textStyle14
                                    .copyWith(color: const Color(0xff1145FF)),
                              ),
                            )
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
    );
  }

  TextFormField myCustomTextFormField(TextEditingController controller,
      String hintText, TextInputType inputType, bool obscureText) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please fill this field';
        }
        return null;
      },
      obscureText: obscureText,
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
