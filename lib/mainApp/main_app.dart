import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/fetch_students_bloc.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen();
  }
}
