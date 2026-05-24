import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/main.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final Future<List<dynamic>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = Future.wait([_fetchUserData(), _fetchAnnouncements()]);
  }

  Future<Map<String, dynamic>> _fetchUserData() {
    return supabase
        .from('users')
        .select('name, last_name, id_number, user_role, profile_url')
        .eq('id', supabase.auth.currentUser!.id)
        .single();
  }

  Future<List<Map<String, dynamic>>> _fetchAnnouncements() {
    return supabase
        .from('announcement')
        .select()
        .order('created_at', ascending: false);
  }

  String _formatDate(String rawDate) =>
      DateFormat.yMMMMd().format(DateTime.parse(rawDate));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<dynamic>>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasError) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(child: Text('Failed to load. Please restart the app.')),
            );
          }

          final userData = snapshot.data![0] as Map<String, dynamic>;
          final announcements = snapshot.data![1] as List<Map<String, dynamic>>;
          final name = userData['name'];
          final lastName = userData['last_name'];
          final idNumber = userData['id_number'];
          final userRole = userData['user_role'];
          final profileUrl = userData['profile_url'];

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
                      Color(0xff008BF2).withValues(alpha: 0.6),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 38,
                              height: 39,
                              child: CircleAvatar(
                                backgroundImage: profileUrl == null
                                    ? const AssetImage(AssetsData.imgAvatar)
                                        as ImageProvider
                                    : NetworkImage(profileUrl),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$lastName $name',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
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
                                    color: Color(0xff1145FF).withValues(alpha: 0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                  )
                                ],
                                color: const Color(0xff1145FF),
                              ),
                            ),
                            QrImageView(
                              data:
                                  'Name: $name \nLast name: $lastName \nId number: $idNumber \nRole: $userRole',
                              version: QrVersions.auto,
                              size: 240,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xffEBEFF9)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 16),
                      child: Text(
                        'Announcement',
                        style: Styles.textStyle20.copyWith(
                          color: const Color(0xff242424),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (announcements.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Center(child: Text('No announcements yet.')),
                      )
                    else
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: announcements.length,
                        itemBuilder: (context, index) {
                          final announcement = announcements[index];
                          return Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 11),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Affichage',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    _formatDate(announcement['created_at']),
                                    style: const TextStyle(
                                      color: Color(0xff626262),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    announcement['content'],
                                    textAlign: TextAlign.justify,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      'pr. ${announcement['last_name']}',
                                      style: const TextStyle(
                                        color: Color(0xff626262),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
