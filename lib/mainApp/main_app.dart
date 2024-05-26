import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/fetchBlocs/fetch_classrooms_bloc.dart';
import 'bloc/fetchBlocs/fetch_students_bloc.dart';
import 'bloc/fetchBlocs/fetch_subject_bloc.dart';
import 'screens/dashboard/dashboard_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    context.read<FetchStudentBloc>().add(FetchStudent());
    context.read<FetchSubjectsBloc>().add(FetchSubjects());
    context.read<FetchClassRoomBloc>().add(FetchClassRoom());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen();
  }
}
