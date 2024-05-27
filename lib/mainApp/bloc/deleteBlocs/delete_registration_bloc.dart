import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteRegistrationBloc extends Bloc<DeleteRegistrationEvent, DeleteRegistrationState> {
  DeleteRegistrationBloc() : super(DeleteRegistrationInitial()) {
    on<DeleteRegistration>((event, emit) async {
      emit(DeleteRegistrationProgress());
      var client = http.Client();

      try {
        var url = 'http://nibrahim.pythonanywhere.com/registration/${event.registrationId}?api_key=0C9eb';
        var response = await client.delete(Uri.parse(url));

        if (response.statusCode == 200) {
          emit(DeleteRegistrationSuccess());
        } else {
          emit(DeleteRegistrationFailure());
        }
      } on PlatformException catch (e) {
        if (kDebugMode) {
          debugPrint('delete_registration_bloc.dart [Platform Exception]>> \n $e');
        }
        emit(DeleteRegistrationFailure());
      } catch (e) {
        if (kDebugMode) {
          debugPrint('delete_registration_bloc.dart [Exception]>> \n $e');
        }
        emit(DeleteRegistrationFailure());
      } finally {
        client.close();
      }
    });
  }
}

// State instantiation
abstract class DeleteRegistrationState {}

// Event instantiation
abstract class DeleteRegistrationEvent {}

// State implementations
class DeleteRegistrationInitial extends DeleteRegistrationState {}

class DeleteRegistrationProgress extends DeleteRegistrationState {}

class DeleteRegistrationSuccess extends DeleteRegistrationState {}

class DeleteRegistrationFailure extends DeleteRegistrationState {}

// Event implementation
class DeleteRegistration extends DeleteRegistrationEvent {
  DeleteRegistration({
    required this.registrationId,
  });
  final int registrationId;
}
