import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mainApp/bloc/fetch_students_bloc.dart';
import 'mainApp/constants/strings/app_constants.dart';
import 'mainApp/main_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchStudentBloc(),
        ),
      ],
      child: MaterialApp(
        title: AppConstants.appTitle,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Jost',
          brightness: Brightness.light,
        ),
        home: const MainApp(),
      ),
    );
  }
}
