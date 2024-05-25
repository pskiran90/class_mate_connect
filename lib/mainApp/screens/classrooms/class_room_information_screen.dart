import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/conference_room_model.dart';
import '../../reusables/header.dart';
import 'classRoomView/class_room_view.dart';
import 'conferenceView/conference_room_view.dart';

class ClassRoomInformationScreen extends StatelessWidget {
  final int selectedClassRoomId;

  const ClassRoomInformationScreen({
    Key? key,
    required this.selectedClassRoomId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: FutureBuilder<ConferenceRoomModel>(
        future: fetchData(selectedClassRoomId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            final classRoomModel = snapshot.data!;
            final bool isClassRoom = classRoomModel.layout == "classroom";
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Header(
                    title: isClassRoom ? "ClassRoom Details" : "Conference Details",
                  ),
                  SizedBox(
                    height: size.height - 135,
                    width: size.width,
                    child: isClassRoom ? ClassRoomView(classRoomModel: classRoomModel) : ConferenceRoomView(classRoomModel: classRoomModel),
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
