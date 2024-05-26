import 'package:class_mate_connect/mainApp/reusables/colors.dart';
import 'package:class_mate_connect/mainApp/screens/registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/fetchBlocs/fetch_registration_bloc.dart';
import '../../../bloc/fetchBlocs/fetch_students_bloc.dart';
import '../../../bloc/fetchBlocs/fetch_subject_bloc.dart';
import '../../../bloc/updateBlocs/registration_bloc.dart';
import '../../../reusables/buttons.dart';
import '../../../reusables/globals.dart';
import '../../../reusables/header.dart';
import '../../students/students_screen.dart';
import '../../../reusables/navigators.dart';
import '../../../reusables/sized_box.dart';
import '../../subjects/subjects_screen.dart';
import 'new_registration_tile.dart';

class NewRegistrationScreen extends StatelessWidget {
  const NewRegistrationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String studentName = "";
    String subjectName = "";
    GlobalNotifier globalNotifier = GlobalNotifier();
    int regId = globalNotifier.regIdNotifier.value;
    int subjectId = globalNotifier.subjectNotifier.value;
    int studentId = globalNotifier.studentNotifier.value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            removeScreen(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, rsb) {
              return BlocBuilder<FetchSubjectsBloc, FetchSubjectsState>(
                builder: (context, fsj) {
                  return BlocBuilder<FetchStudentBloc, FetchStudentState>(
                    builder: (context, fsb) {
                      if (fsb is FetchStudentInitial) {
                        context.read<FetchStudentBloc>().add(FetchStudent());
                        context.read<FetchSubjectsBloc>().add(FetchSubjects());
                      }
                      if (fsb is FetchStudentSuccess && fsj is FetchSubjectsSuccess) {
                        studentName = studentId != 0
                            ? fsb.studentsList
                                .firstWhere(
                                  (element) => element.id == studentId,
                                )
                                .name
                            : "";
                        subjectName = subjectId != 0
                            ? fsj.subjects
                                .firstWhere(
                                  (element) => element.id == subjectId,
                                )
                                .name
                            : "";

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Header(
                                title: "New Registration",
                              ),
                              hb20,
                              NewRegistrationTile(
                                onTap: () => pushSimple(
                                  context,
                                  const StudentsScreen(isRegistration: true),
                                ),
                                title: studentId == 0 ? "Select a student" : studentName,
                              ),
                              hb8,
                              NewRegistrationTile(
                                onTap: () {
                                  pushSimple(
                                    context,
                                    const SubjectsScreen(
                                      isSubjectChangable: false,
                                      isRegistration: true,
                                    ),
                                  );
                                },
                                title: subjectId == 0 ? "Select a subject" : subjectName,
                              ),
                              hb50,
                              CustomButton(
                                buttonClr: greenClr,
                                title: "Register",
                                titleClr: white,
                                onPressed: () {
                                  Map<String, dynamic> registrationMap = <String, dynamic>{
                                    "id": (regId + 1).toString(),
                                    "student": studentId.toString(),
                                    "subject": subjectId.toString(),
                                  };
                                  context.read<RegistrationBloc>().add(Registration(updateRegistrationMap: registrationMap));
                                  pushSimple(context, const RegistrationScreen());
                                  context.read<FetchRegistrationBloc>().add(FetchRegistration());
                                },
                              )
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
