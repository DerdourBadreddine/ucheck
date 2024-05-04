import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/main.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

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
    return SingleChildScrollView(
      child: Column(
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
                        const SizedBox(
                          width: 38,
                          height: 39,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(AssetsData.imgAvatar),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '$lastName $name ',
                          style: const TextStyle(color: Colors.white),
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
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffEBEFF9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  child: Text('Announcement',
                      style: Styles.textStyle20.copyWith(
                          color: const Color(0xff242424),
                          fontWeight: FontWeight.bold)),
                ),
                LimitedBox(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 11),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Affichage',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Yesterday at 10:00 pm',
                                style: TextStyle(
                                  color: Color(0xff626262),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                                textAlign: TextAlign.justify,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  'pr. boufendi',
                                  style: TextStyle(
                                    color: Color(0xff626262),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
