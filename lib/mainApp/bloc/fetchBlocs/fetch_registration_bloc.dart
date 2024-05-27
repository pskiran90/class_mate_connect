import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../models/registration_model.dart';

class FetchRegistrationBloc extends Bloc<FetchRegistrationEvent, FetchRegistrationState> {
  FetchRegistrationBloc() : super(FetchRegistrationInitial()) {
    on<FetchRegistration>((event, emit) async {
      emit(FetchRegistrationProgress());
      if (kDebugMode) debugPrint("FetchRegistrationBloc started");
      var client = http.Client();
      try {
        var response = await client.get(
          Uri.parse('http://nibrahim.pythonanywhere.com/registration/?api_key=0C9eb'),
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          RegistrationList registrationList = RegistrationList.fromJson(jsonResponse['registrations']);
          debugPrint("registrationList: ${registrationList.registrationList.toString()}");
          emit(FetchRegistrationSuccess(registrationList: registrationList.registrationList));
        } else {
          emit(FetchRegistrationFailure('Failed to fetch data. Status code: ${response.statusCode}'));
        }
      } catch (e) {
        emit(FetchRegistrationFailure('Failed to fetch data. Error: $e'));
      } finally {
        client.close();
      }
    });
  }
}

/// Define events
abstract class FetchRegistrationEvent {}

class FetchRegistration extends FetchRegistrationEvent {}

/// Define states
abstract class FetchRegistrationState {}

class FetchRegistrationInitial extends FetchRegistrationState {}

class FetchRegistrationProgress extends FetchRegistrationState {}

class FetchRegistrationSuccess extends FetchRegistrationState {
  final List<RegistrationModel> registrationList;

  FetchRegistrationSuccess({required this.registrationList});
}

class FetchRegistrationFailure extends FetchRegistrationState {
  final String error;

  FetchRegistrationFailure(this.error);
}
