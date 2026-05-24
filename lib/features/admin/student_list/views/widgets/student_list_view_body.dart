import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/main.dart';

class StudentListViewBody extends StatefulWidget {
  const StudentListViewBody({super.key});

  @override
  State<StudentListViewBody> createState() => _StudentListViewBodyState();
}

class _StudentListViewBodyState extends State<StudentListViewBody> {
  late final Future<List<Map<String, dynamic>>> _studentListFuture;

  @override
  void initState() {
    super.initState();
    _studentListFuture = fetchstudentListData();
  }

  Future<void> requestStoragePermission(BuildContext context) async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    final status = deviceInfo.version.sdkInt > 32
        ? await Permission.manageExternalStorage.request()
        : await Permission.storage.request();

    if (status.isGranted) {
      return;
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Permission is denied')));
    }
  }

  Future<List<Map<String, dynamic>>> fetchstudentListData() async {
    final result = await supabase.from('student_lists').select();
    return result;
  }

  Future<Map<String, dynamic>?> fetchExamData() async {
    final result = await supabase
        .from('calendarAppointments')
        .select()
        .eq('date', DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .limit(1);
    return result.isNotEmpty ? result.first : null;
  }

  Future<void> pdf(BuildContext context) async {
    final pdf = pw.Document();

    final image = pw.MemoryImage(
      (await rootBundle.load(AssetsData.imgbgStudentList)).buffer.asUint8List(),
    );

    final listStudentData = await fetchstudentListData();
    final examData = await fetchExamData();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(0),
        build: (pw.Context context) {
          const listStyle = pw.TextStyle(
            color: PdfColor.fromInt(0xff000000),
            fontSize: 14,
          );

          return pw.Container(
            width: double.infinity,
            height: double.infinity,
            child: pw.Stack(
              children: [
                pw.Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: -250,
                  child: pw.Image(image, fit: pw.BoxFit.cover),
                ),
                pw.Positioned(
                  top: 30,
                  right: 20,
                  child: pw.Text(examData?['date'] ?? 'yyyy-mm-dddd'),
                ),
                pw.Center(
                  child: pw.Column(children: [
                    pw.SizedBox(height: 70),
                    pw.Container(
                      width: 260,
                      height: 25,
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                              width: 1, color: PdfColors.black),
                          borderRadius: pw.BorderRadius.circular(10)),
                      child: pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child:
                            pw.Text(examData?['faculty'] ?? 'Faculty'),
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Container(
                      width: 260,
                      height: 25,
                      decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(10),
                        border: pw.Border.all(
                            width: 1, color: PdfColors.black),
                      ),
                      child: pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text(
                            examData?['department'] ?? 'Department'),
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Container(
                      width: 260,
                      height: 25,
                      decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(10),
                        border: pw.Border.all(
                            width: 1, color: PdfColors.black),
                      ),
                      child: pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child:
                            pw.Text(examData?['subject'] ?? 'Module'),
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Container(
                      width: 260,
                      height: 25,
                      decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(10),
                        border: pw.Border.all(
                            width: 1, color: PdfColors.black),
                      ),
                      child: pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text(
                            examData?['principal_teacher'] ??
                                'Principal teacher'),
                      ),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Container(
                        width: 384,
                        height: 600,
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                              width: 1, color: PdfColors.black),
                        ),
                        child: pw.Column(
                          children: listStudentData
                              .map(
                                (student) => pw.Row(
                                  children: [
                                    pw.Expanded(
                                      child: pw.Padding(
                                        padding:
                                            const pw.EdgeInsets.all(8),
                                        child: pw.Text(
                                          '${student['last_name']} ${student['name']}',
                                          style: listStyle,
                                        ),
                                      ),
                                    ),
                                    pw.Padding(
                                      padding:
                                          const pw.EdgeInsets.all(8),
                                      child: pw.Container(
                                        width: 89,
                                        height: 28,
                                        decoration: pw.BoxDecoration(
                                          color: const PdfColor.fromInt(
                                              0xff08BA3C),
                                          borderRadius:
                                              pw.BorderRadius.circular(4),
                                        ),
                                        child: pw.Align(
                                          alignment: pw.Alignment.center,
                                          child: pw.Text('cheked in',
                                              style: listStyle.copyWith(
                                                  color:
                                                      PdfColors.white)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ))
                  ]),
                )
              ],
            ),
          );
        },
      ),
    );
    if (!context.mounted) return;
    await requestStoragePermission(context);

    final directory = Directory('/storage/emulated/0/Download');
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    final filename =
        '${examData?['principal_teacher'] ?? 'principal_teacher'}_${examData?['subject'] ?? 'module'}.pdf';
    final file = File('${directory.path}/$filename');
    await file.writeAsBytes(await pdf.save());

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved to: ${file.path}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsData.imgbgStudentList))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff008BF2),
                    minimumSize: const Size(80, 28),
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                onPressed: () {
                  pdf(context);
                },
                child: Text(
                  'export list',
                  style: Styles.textStyle13.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(
              'Student List',
              style: Styles.textStyle20.copyWith(color: Colors.black),
            ),
            FutureBuilder(
              future: _studentListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('error: ${snapshot.error}'));
                }
                final listStudentData = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: listStudentData.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      final studentNames = listStudentData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 56,
                              height: 57,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(AssetsData.imgAvatar),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '${studentNames['last_name']} ${studentNames['name']}',
                                style: Styles.textStyle17,
                              ),
                            ),
                            Container(
                              width: 89,
                              height: 28,
                              decoration: BoxDecoration(
                                color: const Color(0xff08BA3C),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'cheked in',
                                  style: Styles.textStyle13.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
