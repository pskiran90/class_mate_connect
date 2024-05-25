import 'package:flutter/material.dart';

import '../../models/class_room_model.dart';
import '../../reusables/header.dart';
import 'classRoomView/clas_room_view.dart';

class ClassRoomInformationScreen extends StatelessWidget {
  final ClassRoomModel student;

  const ClassRoomInformationScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(
              title: "ClassRoom Details",
            ),
            ClassRoomView()
          ],
        ),
      ),
    );
  }
}
