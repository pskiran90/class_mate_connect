import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mainApp/bloc/deleteBlocs/delete_registration_bloc.dart';
import 'mainApp/bloc/fetchBlocs/fetch_classrooms_bloc.dart';
import 'mainApp/bloc/fetchBlocs/fetch_registration_bloc.dart';
import 'mainApp/bloc/fetchBlocs/fetch_students_bloc.dart';
import 'mainApp/bloc/fetchBlocs/fetch_subject_bloc.dart';
import 'mainApp/bloc/updateBlocs/registration_bloc.dart';
import 'mainApp/bloc/updateBlocs/update_subject_bloc.dart';
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
        BlocProvider(create: (context) => FetchStudentBloc()),
        BlocProvider(create: (context) => RegistrationBloc()),
        BlocProvider(create: (context) => UpdateSubjectBloc()),
        BlocProvider(create: (context) => FetchSubjectsBloc()),
        BlocProvider(create: (context) => FetchClassRoomBloc()),
        BlocProvider(create: (context) => FetchRegistrationBloc()),
        BlocProvider(create: (context) => DeleteRegistrationBloc()),
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
