import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
  late Future<Map<String, dynamic>> _userDataFuture;

  @override
  void initState() {
    super.initState();
    _userDataFuture = _fetchUserData();
  }

  Future<Map<String, dynamic>> _fetchUserData() {
    return supabase
        .from('users')
        .select()
        .eq('id', supabase.auth.currentUser!.id)
        .single();
  }

  Future<void> pickAndUploadImage() async {
    final XFile? profileImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (profileImage == null) return;
    final imageBytes = await profileImage.readAsBytes();
    final userId = supabase.auth.currentUser!.id;
    await supabase.storage.from('profiles').uploadBinary(
          '/$userId/profile',
          imageBytes,
          fileOptions: FileOptions(
              cacheControl: '3600',
              upsert: true,
              contentType:
                  'image/${profileImage.path.split('.').last.toLowerCase()}'),
        );
    final imageUrl =
        supabase.storage.from('profiles').getPublicUrl('/$userId/profile');
    await supabase
        .from('users')
        .update({'profile_url': imageUrl}).eq('id', userId);
    if (!mounted) return;
    setState(() {
      _userDataFuture = _fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: _userDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('error:  ${snapshot.error}'));
              } else {
                final userData = snapshot.data as Map<String, dynamic>;
                final profileUrl = userData['profile_url'];
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
                                  Color(0xff3126B4).withValues(alpha: 0.88),
                                  Color(0xff008BF2).withValues(alpha: 0.79),
                                ])),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundImage: profileUrl == null
                                ? const AssetImage(AssetsData.imgAvatar)
                                    as ImageProvider
                                : NetworkImage(profileUrl),
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            pickAndUploadImage();
                          },
                          child: const Icon(Icons.add_a_photo)),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Text(
                            '${userData['last_name']} ${userData['name']}',
                            style: Styles.textStyle24,
                          ),
                          Text(
                            userData['user_role'] == 'student'
                                ? '${userData['user_categorie']}'
                                : '${userData['user_categorie']} teacher',
                            style: Styles.textStyle13,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            userData['user_role'] == 'student'
                                ? 'Student id'
                                : 'Teacher id',
                            style: Styles.textStyle13,
                          ),
                          Text(
                            userData['id_number'],
                            style: Styles.textStyle16,
                          ),
                          const SizedBox(height: 20),
                          Text('Email', style: Styles.textStyle13),
                          Text(userData['email'], style: Styles.textStyle16),
                        ],
                      ),
                      const SizedBox(height: 70),
                      Column(
                        children: [
                          const SizedBox(height: 20),
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
