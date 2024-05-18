import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/features/admin/calendar_admin/widgets/colors.dart';
import 'package:ucheck/main.dart';

class ExamFormView extends StatefulWidget {
  const ExamFormView({super.key});

  @override
  State<ExamFormView> createState() => _ExamFormViewState();
}

class _ExamFormViewState extends State<ExamFormView> {
  TextEditingController facultyController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController teacherController = TextEditingController();
  TextEditingController moduleController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  String _selectedStudentLevel = 'L1 info';

  final List<String> _levels = [
    'L1 info',
    'L2 info',
    'L3 info si',
    'L3 info isil',
    'M1 glaa',
    'M2 glaa',
    'M1 res',
    'M2 res',
    'M1 si',
    'M2 si',
    'M1 siaa',
    'M2 siaa',
    'M1 ai',
    'M2 ai'
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showDatePicker() async {
    await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        if (value != null) {
          final formatter = DateFormat('yyyy-MM-dd');
          final formattedDate = formatter.format(value);
          dateController.text = formattedDate;
        } else {
          null;
        }
      });
    });
  }

  void _showHourPickerStart() async {
    await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 08, minute: 00),
    ).then((value) {
      if (value != null) {
        setState(() {
          fromController.text = value.format(context);
        });
      }
    });
  }

  void _showHourPickerEnd() async {
    await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 08, minute: 00),
    ).then((value) {
      if (value != null) {
        setState(() {
          toController.text = value.format(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 355,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetsData.imgBackgroundExamForm),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Exam \nForm',
                        style: Styles.textStyle46,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'Exam schedule form',
                style: Styles.textStyle20.copyWith(
                  color: const Color(0xff242424),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        myCustomTextFormFieldExam(
                            facultyController, 'Faculty', TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        myCustomTextFormFieldExam(departmentController,
                            'Department', TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        myCustomTextFormFieldExam(teacherController,
                            'principal Teacher', TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        myCustomTextFormFieldExam(
                            moduleController, 'Module', TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        PopupMenuButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.grey, width: 1)),
                          onSelected: (value) {
                            _selectedStudentLevel = value;
                            setState(() {});
                          },
                          initialValue: _selectedStudentLevel,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xffE1DFEC),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(child: Text(_selectedStudentLevel)),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                          itemBuilder: (context) => _levels
                              .map(
                                (level) => PopupMenuItem<String>(
                                  value: level,
                                  child: Text(level),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        myCustomdateAndHour(
                            _showDatePicker,
                            dateController,
                            'Date',
                            const Icon(Icons.date_range_outlined),
                            TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 112,
                              child: myCustomdateAndHour(
                                  _showHourPickerStart,
                                  fromController,
                                  'From',
                                  const Icon(Icons.watch_later_outlined),
                                  TextAlign.center),
                            ),
                            SizedBox(
                              width: 112,
                              child: myCustomdateAndHour(
                                  _showHourPickerEnd,
                                  toController,
                                  'To',
                                  const Icon(Icons.watch_later_outlined),
                                  TextAlign.center),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 49,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff1145FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(47),
                                )),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await supabase
                                    .from('calendarAppointment')
                                    .insert({
                                  'faculty': facultyController.text,
                                  'department': departmentController.text,
                                  'principal_teacher': teacherController.text,
                                  'subject': moduleController.text,
                                  'date': dateController.text,
                                  'start_at': fromController.text,
                                  'end_at': toController.text,
                                  'exam_level': _selectedStudentLevel,
                                  'color': appointmentColor[Random()
                                      .nextInt(appointmentColor.length)],
                                });
                              }
                              if (!context.mounted) return;
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Send',
                              style: Styles.textStyle14.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField myCustomdateAndHour(
      VoidCallback function,
      TextEditingController controller,
      String title,
      Icon icon,
      TextAlign textAlign) {
    return TextFormField(
      onTap: function,
      textAlign: textAlign,
      controller: controller,
      keyboardType: TextInputType.none,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please fill this field';
        }
        return null;
      },
      style: Styles.textStyle12.copyWith(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: title,
        hintStyle: Styles.textStyle12.copyWith(color: Colors.black),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffE1DFEC),
            ),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE1DFEC)),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  TextFormField myCustomTextFormFieldExam(
      TextEditingController textController, String title, TextAlign textAlign) {
    return TextFormField(
      textAlign: textAlign,
      controller: textController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please fill this field';
        }
        return null;
      },
      style: Styles.textStyle12.copyWith(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        hintText: title,
        hintStyle: Styles.textStyle12.copyWith(color: Colors.black),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffE1DFEC),
            ),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE1DFEC)),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
