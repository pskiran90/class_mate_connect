import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fetchBlocs/fetch_subject_bloc.dart';
import '../../bloc/updateBlocs/update_subject_bloc.dart';
import '../../reusables/globals.dart';
import '../../reusables/header.dart';
import '../../reusables/loader.dart';
import '../../reusables/navigators.dart';
import '../../reusables/snack_bar.dart';
import '../classrooms/class_room_information_screen.dart';
import '../registration/newRegistration/new_registration_view.dart';
import 'subject_information_screen.dart';
import 'subjects_screen_widgets.dart';

class SubjectsScreen extends StatelessWidget {
  final int? roomId;
  final bool isSubjectChangable;
  final bool isRegistration;
  const SubjectsScreen({
    super.key,
    this.roomId,
    required this.isSubjectChangable,
    required this.isRegistration,
  });

  @override
  Widget build(BuildContext context) {
    GlobalNotifier().subjectNotifier.addListener(
      () {
        if (GlobalNotifier().subjectNotifier.value != 0) {
          pushSimple(
            context,
            const NewRegistrationScreen(),
          );
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
        child: BlocBuilder<FetchSubjectsBloc, FetchSubjectsState>(
          builder: (context, fsb) {
            if (fsb is FetchSubjectsProgress) {
              return const LoaderContainerWithMessage(
                message: "Please wait Loading Subjects",
              );
            } else if (fsb is FetchSubjectsSuccess) {
              return BlocListener<UpdateSubjectBloc, UpdateSubjectState>(
                listener: (context, usb) {
                  if (usb is UpdateSubjectSuccess) {
                    showSnackBar(
                      context,
                      "Subject added successfully",
                      error: false,
                    );
                    pushByReplacing(
                      context,
                      ClassRoomInformationScreen(
                        selectedClassRoomId: roomId!,
                        subjects: fsb.subjects,
                      ),
                    );
                  }
                },
                child: Column(
                  children: [
                    const Header(
                      title: "Subjects",
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: fsb.subjects.length,
                        itemBuilder: (context, index) {
                          return SubjectsTile(
                            action: () {
                              var selectedSubject = fsb.subjects.firstWhere((element) => element.id == index + 1);
                              isSubjectChangable
                                  ? context.read<UpdateSubjectBloc>().add(
                                        UpdateSubject(
                                          updateSubjectId: roomId!,
                                          newSubjectId: selectedSubject.id,
                                        ),
                                      )
                                  : isRegistration
                                      ? GlobalNotifier().subjectNotifier.value = selectedSubject.id
                                      : pushSimple(
                                          context,
                                          SubjectInformationScreen(student: selectedSubject),
                                        );
                              debugPrint("selectedSubject.id: ${GlobalNotifier().subjectNotifier.value}");
                            },
                            studentsList: fsb.subjects[index],
                            selectedId: index + 1,
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
