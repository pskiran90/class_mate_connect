import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../models/class_room_model.dart';

class FetchClassRoomBloc extends Bloc<FetchClassRoomEvent, FetchClassRoomState> {
  FetchClassRoomBloc() : super(FetchClassRoomInitial()) {
    on<FetchClassRoom>((event, emit) async {
      emit(FetchClassRoomProgress());
      if (kDebugMode) debugPrint("FetchClassRoomBloc started");
      var client = http.Client();
      try {
        var response = await client.get(
          Uri.parse('https://nibrahim.pythonanywhere.com/classrooms/?api_key=0C9eb'),
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          ClassRoomList classRoomLists = ClassRoomList.fromJson(jsonResponse['classrooms']);

          emit(FetchClassRoomSuccess(dataList: classRoomLists.classRooms));
        } else {
          emit(FetchClassRoomFailure('Failed to fetch data. Status code: ${response.statusCode}'));
        }
      } catch (e) {
        emit(FetchClassRoomFailure('Failed to fetch data. Error: $e'));
      } finally {
        client.close();
      }
    });
  }
}

/// Define events
abstract class FetchClassRoomEvent {}

class FetchClassRoom extends FetchClassRoomEvent {}

/// Define states
abstract class FetchClassRoomState {}

class FetchClassRoomInitial extends FetchClassRoomState {}

class FetchClassRoomProgress extends FetchClassRoomState {}

class FetchClassRoomSuccess extends FetchClassRoomState {
  final List<ClassRoomModel> dataList;

  FetchClassRoomSuccess({required this.dataList});
}

class FetchClassRoomFailure extends FetchClassRoomState {
  final String error;

  FetchClassRoomFailure(this.error);
}
