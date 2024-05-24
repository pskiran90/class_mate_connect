import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/students_model.dart';

class FetchStudentBloc extends Bloc<FetchStudentEvent, FetchStudentState> {
  FetchStudentBloc() : super(FetchStudentInitial()) {
    on<FetchStudent>((event, emit) async {
      emit(FetchStudentProgress());
      if (kDebugMode) debugPrint("FetchStudentBloc started");
      var client = http.Client();
      try {
        var response = await client.get(
          Uri.parse('https://nibrahim.pythonanywhere.com/students/?api_key=0C9eb'),
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          StudentSummaryList studentSummaryList = StudentSummaryList.fromJson(jsonResponse['students']);
          
          emit(FetchStudentSuccess(dataList: studentSummaryList.transactionSummary));
        } else {
          emit(FetchStudentFailure('Failed to fetch data. Status code: ${response.statusCode}'));
        }
      } catch (e) {
        emit(FetchStudentFailure('Failed to fetch data. Error: $e'));
      } finally {
        client.close();
      }
    });
  }
}

/// Define events
abstract class FetchStudentEvent {}

class FetchStudent extends FetchStudentEvent {}

/// Define states
abstract class FetchStudentState {}

class FetchStudentInitial extends FetchStudentState {}

class FetchStudentProgress extends FetchStudentState {}

class FetchStudentSuccess extends FetchStudentState {
  final List<StudentModel> dataList;

  FetchStudentSuccess({required this.dataList});
}

class FetchStudentFailure extends FetchStudentState {
  final String error;

  FetchStudentFailure(this.error);
}
