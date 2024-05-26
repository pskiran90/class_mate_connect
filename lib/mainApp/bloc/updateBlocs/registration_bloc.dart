import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<Registration>((event, emit) async {
      emit(RegistrationProgress());
      var client = http.Client();

      try {
        var response = await client.post(
          Uri.parse('http://nibrahim.pythonanywhere.com/registration/?api_key=0C9eb'),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          body: event.updateRegistrationMap,
        );
        if (response.statusCode == 200) {
          emit(RegistrationSuccess());
        } else {
          emit(RegistrationFailure());
        }
      } on PlatformException catch (e) {
        if (kDebugMode) debugPrint('update_policy_file_bloc.dart [Platform Exception]>> \n $e');
        emit(RegistrationFailure());
      } catch (e) {
        if (kDebugMode) debugPrint('update_policy_file_bloc.dart [Exception]>> \n $e');
        emit(RegistrationFailure());
      }
    });
  }
}

// State instantiation
abstract class RegistrationState {}

// Event instantiation
abstract class RegistrationEvent {}

// State implementations
class RegistrationInitial extends RegistrationState {}

class RegistrationProgress extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {}

class RegistrationFailure extends RegistrationState {}

// Event implementation
class Registration extends RegistrationEvent {
  Registration({
    required this.updateRegistrationMap,
  });
  final Map<String, dynamic> updateRegistrationMap;
}
