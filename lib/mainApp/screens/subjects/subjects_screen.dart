import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fetch_subject_bloc.dart';
import '../../reusables/header.dart';
import '../../reusables/loader.dart';
import '../../reusables/navigators.dart';
import 'subject_information_screen.dart';
import 'subjects_screen_widgets.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

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
      body: SafeArea(
        child: BlocBuilder<FetchSubjectsBloc, FetchSubjectsState>(
          builder: (context, fsb) {
            if (fsb is FetchSubjectsProgress) {
              return const LoaderContainerWithMessage(
                message: "Please wait Loading Subjects",
              );
            } else if (fsb is FetchSubjectsSuccess) {
              return Column(
                children: [
                  const Header(
                    title: "Subjects",
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: fsb.dataList.length,
                      itemBuilder: (context, index) {
                        return SubjectsTile(
                          action: () {
                            var selectedStudent = fsb.dataList.firstWhere((element) => element.id == index + 1);
                            pushSimple(
                              context,
                              SubjectInformationScreen(student: selectedStudent),
                            );
                          },
                          studentsList: fsb.dataList[index],
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
