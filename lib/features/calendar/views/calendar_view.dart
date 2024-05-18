import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/main.dart';

class MyCalendarView extends StatefulWidget {
  const MyCalendarView({super.key});

  @override
  State<MyCalendarView> createState() => _MyCalendarViewState();
}

class _MyCalendarViewState extends State<MyCalendarView> {
  Future<List<Map<String, dynamic>>> fetchAppointmentData() async {
    final studentLevel = await supabase
        .from('users')
        .select('user_categorie')
        .eq('id', supabase.auth.currentUser!.id)
        .single();
    final res = await supabase
        .from('calendarAppointment')
        .select()
        .eq('exam_level', studentLevel['user_categorie']);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xff008BF2),
        elevation: 0,
      ),
      body: FutureBuilder(
          future: fetchAppointmentData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('has error:${snapshot.hasError}'),
              );
            } else {
              final appointmentData = snapshot.data!;
              final List<Meeting> collection = [];

              for (final appointment in appointmentData) {
                collection.add(Meeting(
                    appointment['subject'],
                    DateTime.parse(
                        '${appointment['date']} ${appointment['start_at']}'),
                    DateTime.parse(
                        '${appointment['date']} ${appointment['end_at']}'),
                    Color(int.parse(appointment['color'])),
                    false));
              }
              return SfCalendar(
                view: CalendarView.week,
                headerHeight: 0,
                firstDayOfWeek: 1,
                // initialSelectedDate: DateTime.now(),
                // initialDisplayDate: DateTime.now(),
                // cellBorderColor: Colors.transparent,
                cellEndPadding: 0,
                viewHeaderHeight: 80,
                todayHighlightColor: Colors.black,
                viewHeaderStyle: ViewHeaderStyle(
                  backgroundColor: const Color(0xff008BF2),
                  dateTextStyle: Styles.textStyle20
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                  dayTextStyle: Styles.textStyle20
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                timeSlotViewSettings: TimeSlotViewSettings(
                  startHour: 7,
                  endHour: 19,
                  numberOfDaysInView: 5,
                  timeFormat: 'HH',
                  timeTextStyle: Styles.textStyle20.copyWith(
                      color: const Color(0xff828282),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  dayFormat: 'EEE',
                  timeIntervalHeight: 80,
                ),
                dataSource: MeetingDataSource(collection),
                appointmentBuilder: appointmentBuilder,
              );
            }
          }),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

Widget appointmentBuilder(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  final Meeting appointment = calendarAppointmentDetails.appointments.first;
  return Column(
    children: [
      Container(
        width: calendarAppointmentDetails.bounds.width,
        height: calendarAppointmentDetails.bounds.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appointment.background,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  DateFormat('hh:mm').format(appointment.from),
                  style: Styles.textStyle12,
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                appointment.eventName,
                textAlign: TextAlign.center,
                style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  DateFormat('hh:mm').format(appointment.to),
                  style: Styles.textStyle12,
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}
