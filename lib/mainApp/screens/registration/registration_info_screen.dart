import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/deleteBlocs/delete_registration_bloc.dart';
import '../../bloc/fetchBlocs/fetch_registration_bloc.dart';
import '../../models/registration_model.dart';
import '../../models/students_model.dart';
import '../../models/subjects_model.dart';
import '../../reusables/alert_box.dart';
import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/navigators.dart';
import '../../reusables/header.dart';
import '../../reusables/sized_box.dart';
import 'registration_info_tile.dart';

class RegistrationInformationScreen extends StatelessWidget {
  final StudentModel student;
  final SubjectsModel subject;
  final RegistrationModel registrationModel;

  const RegistrationInformationScreen({
    super.key,
    required this.registrationModel,
    required this.student,
    required this.subject,
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
      body: BlocListener<DeleteRegistrationBloc, DeleteRegistrationState>(
        listener: (context, drb) {
          if (drb is DeleteRegistrationSuccess) {
            removeScreen(context);
            context.read<FetchRegistrationBloc>().add(FetchRegistration());
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Header(
                  title: "Registration",
                ),
                hb20,
                RegistrationInfoTile(
                  title: 'Student details',
                  secondTitle: student.name,
                  thirdTitle: student.email,
                  trailing: "Age: ${student.age.toString()}",
                ),
                hb10,
                RegistrationInfoTile(
                  title: 'Subject details',
                  secondTitle: subject.name,
                  thirdTitle: subject.teacher,
                  trailing: "Credit: ${subject.credits.toString()}",
                ),
                const Spacer(),
                CustomButton(
                  title: "Delete Registration",
                  titleClr: white,
                  buttonClr: redColor,
                  onPressed: () {
                    showCustomAlertDialog(context, registrationModel.id);
                  },
                ),
                hb12,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
