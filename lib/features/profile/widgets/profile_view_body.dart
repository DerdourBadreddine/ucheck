import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ucheck/core/utils/app_router.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/main.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool islogedOut = false;

  Future<Map<String, dynamic>> fetchUserData() async {
    final session = supabase.auth.currentSession;

    final response = await supabase
        .from('users')
        .select()
        .eq('id', session!.user.id)
        .single();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return islogedOut
        ? Center(child: CircularProgressIndicator())
        : FutureBuilder(
            future: fetchUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('error:  ${snapshot.error}'));
              } else {
                final userData = snapshot.data as Map<String, dynamic>;
                return Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height -
                      kBottomNavigationBarHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsData.imgBackgroundProfile),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 160,
                        height: 164,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xff3126B4).withOpacity(0.88),
                                  const Color(0xff008BF2).withOpacity(0.79),
                                ])),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(AssetsData.imgAvatar),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            '${userData['last_name']} ${userData['name']}',
                            style: Styles.textStyle24,
                          ),
                          Text(
                            '3rd Year info si',
                            style: Styles.textStyle13,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Student Id',
                            style: Styles.textStyle13,
                          ),
                          Text(
                            userData['id_number'],
                            style: Styles.textStyle16,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Email',
                            style: Styles.textStyle13,
                          ),
                          Text(
                            userData['email'],
                            style: Styles.textStyle16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(179, 45),
                              backgroundColor: Colors.white,
                              elevation: 0,
                              side: const BorderSide(color: Color(0xff5174DB)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(58),
                              ),
                            ),
                            child: Text(
                              'Settings',
                              style: Styles.textStyle20.copyWith(
                                fontSize: 18,
                                color: const Color(0xff5174DB),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await supabase.auth.signOut();
                              if (!context.mounted) return;
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.kDefault);
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(179, 45),
                              backgroundColor: const Color(0xff5174DB),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(58),
                              ),
                            ),
                            child: Text(
                              'Log out',
                              style: Styles.textStyle20.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
            },
          );
  }
}
