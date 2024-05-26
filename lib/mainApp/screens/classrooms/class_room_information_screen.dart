import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/subjects_model.dart';
import '../../reusables/loader.dart';
import '../../reusables/navigators.dart';
import '../../reusables/sized_box.dart';
import '../../models/conference_room_model.dart';
import '../../reusables/header.dart';
import 'classRoomView/class_room_view.dart';
import 'classRoomView/room_change_button.dart';
import 'class_rooms.dart';
import 'conferenceView/conference_room_view.dart';

class ClassRoomInformationScreen extends StatelessWidget {
  final int selectedClassRoomId;
  final List<SubjectsModel> subjects;
  const ClassRoomInformationScreen({
    Key? key,
    required this.selectedClassRoomId,
    required this.subjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pushSimple(context, const ClassRoomsScreen(),);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: FutureBuilder<ConferenceRoomModel>(
        future: fetchData(selectedClassRoomId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: LoaderContainerWithMessage(
              message: "Loading..",
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            final roomModel = snapshot.data!;
            final bool isClassRoom = roomModel.layout == "classroom";
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Header(
                    title: isClassRoom ? "ClassRoom Details" : "Conference Details",
                  ),
                  hb20,
                  SubjectContainer(
                    roomModel: roomModel,
                    subjectsList: subjects,
                  ),
                  hb20,
                  SingleChildScrollView(
                    child: SizedBox(
                      height: size.height - 240,
                      width: size.width,
                      child: isClassRoom
                          ? ClassRoomView(roomModel: roomModel)
                          : ConferenceRoomView(
                              classRoomModel: roomModel,
                            ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<ConferenceRoomModel> fetchData(int id) async {
    final response = await http.get(Uri.parse('https://nibrahim.pythonanywhere.com/classrooms/$id?api_key=0C9eb'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ConferenceRoomModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
