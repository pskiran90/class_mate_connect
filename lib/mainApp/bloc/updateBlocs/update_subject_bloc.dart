import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateSubjectBloc extends Bloc<UpdateSubjectEvent, UpdateSubjectState> {
  UpdateSubjectBloc() : super(UpdateSubjectInitial()) {
    on<UpdateSubject>((event, emit) async {
      emit(UpdateSubjectProgress());
      var client = http.Client();

      try {
        var response = await client.patch(
          Uri.parse('http://nibrahim.pythonanywhere.com/classrooms/${event.updateSubjectId}?api_key=0C9eb'),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          body: 'subject=${event.newSubjectId}', 
        );
        debugPrint("response: ${response.body.toString()}");

        if (response.statusCode == 200) {
          emit(UpdateSubjectSuccess());
        } else {
          emit(UpdateSubjectFailure());
        }
      } on PlatformException catch (e) {
        if (kDebugMode) debugPrint('update_policy_file_bloc.dart [Platform Exception]>> \n $e');
        emit(UpdateSubjectFailure());
      } catch (e) {
        if (kDebugMode) debugPrint('update_policy_file_bloc.dart [Exception]>> \n $e');
        emit(UpdateSubjectFailure());
      }
    });
  }
}

// State instantiation
abstract class UpdateSubjectState {}

// Event instantiation
abstract class UpdateSubjectEvent {}

// State implementations
class UpdateSubjectInitial extends UpdateSubjectState {}

class UpdateSubjectProgress extends UpdateSubjectState {}

class UpdateSubjectSuccess extends UpdateSubjectState {}

class UpdateSubjectFailure extends UpdateSubjectState {}

// Event implementation
class UpdateSubject extends UpdateSubjectEvent {
  UpdateSubject({required this.updateSubjectId, required this.newSubjectId});
  final int updateSubjectId;
  final int newSubjectId;
}
