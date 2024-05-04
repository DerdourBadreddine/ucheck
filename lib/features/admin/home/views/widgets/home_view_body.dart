import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/main.dart';

class HomeAdminViewBody extends StatefulWidget {
  const HomeAdminViewBody({Key? key}) : super(key: key);

  @override
  State<HomeAdminViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeAdminViewBody> {
  String? name;
  String? lastName;
  String? idNumber;
  String? userRole;
  Barcode? _barcode;

  final TextEditingController _announcementController = TextEditingController();

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

  Future<List<Map<String, dynamic>>> fetchUserContent() async {
    final res = await supabase.from('announcement').select();
    return res;
  }

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
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
                          '$lastName $name',
                          style: Styles.textStyle14.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
                    color: Colors.white.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: MobileScanner(
                        fit: BoxFit.cover,
                        controller: MobileScannerController(
                          detectionSpeed: DetectionSpeed.noDuplicates,
                          returnImage: true,
                        ),
                        onDetect: (barcodes) {
                          if (mounted) {
                            setState(() {
                              _barcode = barcodes.barcodes.firstOrNull;
                            });
                          }
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Resultat'),
                              content: Text(_barcode?.rawValue ?? ''),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextField(
                        controller: _announcementController,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: 'Share announcement...',
                          hintStyle: Styles.textStyle14
                              .copyWith(color: const Color(0xffBEBEBE)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.only(left: 20, top: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 120,
                            height: 23,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    const Color(0xff4DADF5).withOpacity(0.19),
                              ),
                              onPressed: () async {
                                await supabase.from('announcement').insert({
                                  'last_name': lastName,
                                  'name': name,
                                  'content': _announcementController.text
                                });
                              },
                              child: Text(
                                'Envoyer',
                                style: Styles.textStyle11.copyWith(
                                  color: const Color(0xff3A6CD7),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  child: Text('Announcement',
                      style: Styles.textStyle20.copyWith(
                          color: const Color(0xff242424),
                          fontWeight: FontWeight.bold)),
                ),
                LimitedBox(
                    child: FutureBuilder(
                  future: fetchUserContent(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else {
                      final userContentData = snapshot.data!;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: userContentData.length,
                        itemBuilder: (context, index) {
                          final announcement = userContentData[index];
                          final rawDate = announcement['created_at'];
                          final formattedDate = formatDate(rawDate);
                          return Card(
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
                                    formattedDate,
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
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(String rawDate) {
    final DateTime parsedDate = DateTime.parse(rawDate);
    final DateFormat formatter = DateFormat.yMMMMd().add_jm();
    return formatter.format(parsedDate);
  }
}
