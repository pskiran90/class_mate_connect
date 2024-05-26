import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fetchBlocs/fetch_students_bloc.dart';
import '../../reusables/globals.dart';
import '../../reusables/header.dart';
import '../../reusables/loader.dart';
import '../../reusables/navigators.dart';
import '../registration/newRegistration/new_registration_view.dart';
import 'student_information_screen.dart';
import 'students_screen_widgets.dart';

class StudentsScreen extends StatelessWidget {
  final bool isRegistration;
  const StudentsScreen({
    super.key,
    required this.isRegistration,
  });

  @override
  Widget build(BuildContext context) {
    GlobalNotifier().studentNotifier.addListener(
      () {
        if (GlobalNotifier().studentNotifier.value != 0) {
          pushSimple(context, const NewRegistrationScreen());
        }
      },
    );
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
        child: BlocBuilder<FetchStudentBloc, FetchStudentState>(
          builder: (context, fsb) {
            if (fsb is FetchStudentProgress) {
              return const LoaderContainerWithMessage(
                message: "Loading students data",
              );
            } else if (fsb is FetchStudentSuccess) {
              return Column(
                children: [
                  const Header(
                    title: "Students",
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: fsb.studentsList.length,
                      itemBuilder: (context, index) {
                        return StudentsTile(
                          action: () {
                            var selectedStudent = fsb.studentsList.firstWhere((element) => element.id == index + 1);
                            isRegistration
                                ? GlobalNotifier().studentNotifier.value = selectedStudent.id
                                : pushSimple(
                                    context,
                                    StudentInformationScreen(student: selectedStudent),
                                  );
                          },
                          studentsList: fsb.studentsList[index],
                          selectedId: index + 1,
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("Unable to get data"),
              );
            }
          },
        ),
      ),
    );
  }
}
