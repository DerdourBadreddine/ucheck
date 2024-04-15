import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/main.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String? name;
  String? lastName;
  String? idNumber;
  String? userRole;
  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  Future<void> fetchUserData() async {
    final userData = await supabase
        .from('users')
        .select('name, last_name, id_number, user_role')
        .eq('id', supabase.auth.currentUser!.id)
        .single();
    setState(() {
      name = userData['name'] as String;
      lastName = userData['last_name'] as String;
      idNumber = userData['id_number'] as String;
      userRole = userData['user_role'] as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xff3126B4),
                const Color(0xff008BF2).withOpacity(0.6),
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Evaa Doe',
                        style: Styles.textStyle14.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 230,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(47),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff1145FF).withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                            )
                          ],
                          color: const Color(0xff1145FF),
                        ),
                      ),
                      if (name != null)
                        QrImageView(
                          data:
                              'Name: $name \nLast name: $lastName \nId number: $idNumber \nRole: $userRole',
                          version: QrVersions.auto,
                          size: 240,
                        )
                      else
                        const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
