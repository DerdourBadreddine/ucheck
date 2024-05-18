import 'package:flutter/material.dart';
import 'package:ucheck/features/admin/student_list/views/widgets/student_list_view_body.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StudentListViewBody(),
    );
  }
}
