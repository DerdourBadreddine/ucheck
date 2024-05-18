import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:intl/intl.dart';
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
  String? profileUrl;
  String? userCategorie;
  Barcode? _barcode;
  bool isLoaded = false;

  final TextEditingController _announcementController = TextEditingController();
  final TextEditingController _announcementEditingController =
      TextEditingController();

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  Future<void> fetchUserData() async {
    final userData = await supabase
        .from('users')
        .select('name, last_name, id_number, profile_url, user_categorie')
        .eq('id', supabase.auth.currentUser!.id)
        .single();
    setState(() {
      name = userData['name'] as String;
      lastName = userData['last_name'] as String;
      idNumber = userData['id_number'] as String;
      profileUrl = userData['profile_url'];
      userCategorie = userData['user_categorie'] as String;
      isLoaded = true;
    });
  }

  Future<List<Map<String, dynamic>>> fetchUserContent() async {
    final res = await supabase.from('announcement').select();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: isLoaded
          ? Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 420,
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
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 38,
                                    height: 39,
                                    child: CircleAvatar(
                                      backgroundImage: profileUrl == null
                                          ? const AssetImage(
                                                  AssetsData.imgAvatar)
                                              as ImageProvider
                                          : NetworkImage(profileUrl!),
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
                          SizedBox(
                            height: userCategorie == 'principal' ? 15 : 80,
                          ),
                          userCategorie == 'principal'
                              ? scannerImageContainer(context)
                              : myAnnouncementUi(),
                        ],
                      ),
                    ),
                    userCategorie == 'principal'
                        ? Positioned(
                            bottom: 20,
                            child: Container(
                              width: 80,
                              height: 62,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 45,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
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
                      userCategorie == 'principal'
                          ? myAnnouncementUi()
                          : const SizedBox(),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 22, left: 22, top: 16),
                        child: Text('Announcement',
                            style: Styles.textStyle20.copyWith(
                                color: const Color(0xff242424),
                                fontWeight: FontWeight.bold)),
                      ),
                      LimitedBox(
                          child: FutureBuilder(
                        future: fetchUserContent(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                              padding: const EdgeInsets.all(0),
                              itemCount: userContentData.length,
                              itemBuilder: (context, index) {
                                final announcement = userContentData[index];
                                final rawDate = announcement['created_at'];
                                final formattedDate = formatDate(rawDate);
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Affichage',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            PopupMenuButton(
                                              padding: const EdgeInsets.all(0),
                                              icon: const Icon(
                                                Icons.more_vert,
                                                size: 18,
                                              ),
                                              onSelected: (value) {
                                                if (value == 1) {
                                                  _announcementEditingController
                                                          .text =
                                                      userContentData[index]
                                                          ['content'];
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                title: Text(
                                                                  'Modification',
                                                                  style: Styles
                                                                      .textStyle20
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.black),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                content:
                                                                    TextField(
                                                                  maxLines: 8,
                                                                  autofocus:
                                                                      true,
                                                                  controller:
                                                                      _announcementEditingController,
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context),
                                                                    child: const Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () async {
                                                                      await supabase
                                                                          .from(
                                                                              'announcement')
                                                                          .update({
                                                                        'content':
                                                                            _announcementEditingController.text
                                                                      }).eq('id',
                                                                              userContentData[index]['id']);
                                                                      setState(
                                                                          () {});
                                                                      if (!context
                                                                          .mounted) {
                                                                        return;
                                                                      }
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: const Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              ));
                                                } else if (value == 2) {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                title: Text(
                                                                  'confirmation',
                                                                  style: Styles
                                                                      .textStyle20
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.black),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                content:
                                                                    const Text(
                                                                  'Do you really want to delete this announcement?',
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context),
                                                                    child: const Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () async {
                                                                      await supabase
                                                                          .from(
                                                                              'announcement')
                                                                          .delete()
                                                                          .eq('id',
                                                                              userContentData[index]['id']);
                                                                      setState(
                                                                          () {});
                                                                      if (!context
                                                                          .mounted) {
                                                                        return;
                                                                      }
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: const Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              ));
                                                }
                                              },
                                              itemBuilder: (context) => [
                                                const PopupMenuItem(
                                                  value: 1,
                                                  child: Text('Modify'),
                                                ),
                                                const PopupMenuItem(
                                                  value: 2,
                                                  child: Text('Delete'),
                                                ),
                                              ],
                                            )
                                          ],
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
                                          padding:
                                              const EdgeInsets.only(top: 20),
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
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ],
            )
          : SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  Stack myAnnouncementUi() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: TextField(
            controller: _announcementController,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Share announcement...',
              hintStyle:
                  Styles.textStyle14.copyWith(color: const Color(0xffBEBEBE)),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(left: 20, top: 10),
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
                    backgroundColor: const Color(0xff4DADF5).withOpacity(0.19),
                  ),
                  onPressed: () async {
                    if (_announcementController.text.isEmpty) return;
                    await supabase.from('announcement').insert({
                      'last_name': lastName,
                      'name': name,
                      'content': _announcementController.text
                    });
                    if (!mounted) return;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        icon: const Icon(
                          Icons.check_circle,
                          size: 30,
                        ),
                        iconColor: const Color(0xff01B836),
                        content: Text(
                          'Announcement added successfully!',
                          style: Styles.textStyle14.copyWith(
                            color: const Color(0xff212121),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff01B836),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Return',
                                  style: Styles.textStyle12.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    );

                    setState(() {
                      _announcementController.clear();
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
    );
  }

  Container scannerImageContainer(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white.withOpacity(0.6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: MobileScanner(
            fit: BoxFit.cover,
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
              // returnImage: true,
            ),
            onDetect: (barcodes) async {
              if (mounted) {
                setState(() {
                  _barcode = barcodes.barcodes.firstOrNull;
                });
              }

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  title: const Text('Resultat'),
                  content: Text(_barcode?.rawValue ?? ''),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                    TextButton(
                        onPressed: () async {
                          if (_barcode != null) {
                            final String barcodeData = _barcode!.rawValue!;

                            final List<String> raws = barcodeData.split('\n');

                            String extractedName = '';
                            String extractedLastName = '';
                            String extractedIdNumber = '';

                            for (var raw in raws) {
                              if (raw.toLowerCase().startsWith('name:')) {
                                extractedName =
                                    raw.substring(raw.indexOf(':') + 1).trim();
                              } else if (raw
                                  .toLowerCase()
                                  .startsWith('last name:')) {
                                extractedLastName =
                                    raw.substring(raw.indexOf(':') + 1).trim();
                              } else if (raw
                                  .toLowerCase()
                                  .startsWith('id number:')) {
                                extractedIdNumber =
                                    raw.substring(raw.indexOf(':') + 1).trim();
                              }
                            }
                            final hasResult = await supabase
                                .from('student_list')
                                .select('name, last_name')
                                .eq('last_name', extractedLastName)
                                .maybeSingle()
                                .limit(1);

                            if (hasResult?['name'] == extractedName &&
                                hasResult?['last_name'] == extractedLastName) {
                              if (!context.mounted) return;
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  surfaceTintColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  icon: const Icon(
                                    Icons.dangerous_rounded,
                                    size: 30,
                                  ),
                                  iconColor: const Color(0xffFF0000),
                                  content: SizedBox(
                                    width: 100,
                                    height: 70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Student already exists or qr code not valide',
                                          style: Styles.textStyle14.copyWith(
                                            color: const Color(0xff212121),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff5375DB),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Return',
                                            style: Styles.textStyle12.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              await supabase.from('student_list').insert({
                                'name': extractedName,
                                'last_name': extractedLastName,
                                'id_number': extractedIdNumber
                              });
                              if (!context.mounted) return;
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  surfaceTintColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  icon: const Icon(
                                    Icons.check_circle,
                                    size: 30,
                                  ),
                                  iconColor: const Color(0xff01B836),
                                  content: SizedBox(
                                    width: 100,
                                    height: 70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '$extractedLastName $extractedName',
                                          style: Styles.textStyle14.copyWith(
                                            color: const Color(0xff212121),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          extractedIdNumber,
                                          style: Styles.textStyle12.copyWith(
                                              color: const Color(0xff212121)),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff01B836),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Checked in',
                                            style: Styles.textStyle12.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    )
                                  ],
                                ),
                              );
                            }
                          } else {
                            return;
                          }
                        },
                        child: const Text('Add'))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String formatDate(String rawDate) {
    final DateTime parsedDate = DateTime.parse(rawDate);
    final DateFormat formatter = DateFormat.yMMMMd();
    return formatter.format(parsedDate);
  }
}
