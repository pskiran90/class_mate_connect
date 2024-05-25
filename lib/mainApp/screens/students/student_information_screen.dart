import 'package:flutter/material.dart';

import '../../reusables/sized_box.dart';
import '../../models/students_model.dart';
import '../../reusables/header.dart';
import '../../reusables/styles.dart';

class StudentInformationScreen extends StatelessWidget {
  final StudentModel student;

  const StudentInformationScreen({super.key, required this.student});

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Header(
              title: "Student Details",
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            hb8,
            Text(
              ' ${student.name}',
              style: f18b(),
            ),
            hb8,
            Text(
              'Age: ${student.age}',
              style: f18b(),
            ),
            hb8,
            Text(
              ' ${student.email}',
              style: f18b(),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
