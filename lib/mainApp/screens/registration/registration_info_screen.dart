import 'package:flutter/material.dart';

import '../../models/registration_model.dart';
import '../../models/students_model.dart';
import '../../reusables/navigators.dart';
import '../../reusables/header.dart';
import 'registration_info_tile.dart';

class RegistrationInformationScreen extends StatelessWidget {
  final StudentModel student;
  final RegistrationModel registrationModel;

  const RegistrationInformationScreen({
    super.key,
    required this.registrationModel,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            removeScreen(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Header(
                title: "Registration",
              ),
              RegistrationInfoTile(
                title: '',
                secondTitle: student.name,
                thirdTitle: student.email,
                trailing: student.age.toString(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
