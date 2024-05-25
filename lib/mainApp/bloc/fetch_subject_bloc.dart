import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/subjects_model.dart';

class FetchSubjectsBloc extends Bloc<FetchSubjectsEvent, FetchSubjectsState> {
  FetchSubjectsBloc() : super(FetchSubjectsInitial()) {
    on<FetchSubjects>((event, emit) async {
      emit(FetchSubjectsProgress());
      if (kDebugMode) debugPrint("FetchSubjectsBloc started");
      var client = http.Client();
      try {
        var response = await client.get(
          Uri.parse('https://nibrahim.pythonanywhere.com/subjects/?api_key=0C9eb'),
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          SubjectsList subjectsList = SubjectsList.fromJson(jsonResponse['subjects']);

          emit(FetchSubjectsSuccess(dataList: subjectsList.subjects));
        } else {
          emit(FetchSubjectsFailure('Failed to fetch data. Status code: ${response.statusCode}'));
        }
      } catch (e) {
        emit(FetchSubjectsFailure('Failed to fetch data. Error: $e'));
      } finally {
        client.close();
      }
    });
  }
}

/// Define events
abstract class FetchSubjectsEvent {}

class FetchSubjects extends FetchSubjectsEvent {}

/// Define states
abstract class FetchSubjectsState {}

class FetchSubjectsInitial extends FetchSubjectsState {}

class FetchSubjectsProgress extends FetchSubjectsState {}

class FetchSubjectsSuccess extends FetchSubjectsState {
  final List<SubjectsModel> dataList;

  FetchSubjectsSuccess({required this.dataList});
}

class FetchSubjectsFailure extends FetchSubjectsState {
  final String error;

  FetchSubjectsFailure(this.error);
}
