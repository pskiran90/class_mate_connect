import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fetchBlocs/fetch_students_bloc.dart';
import '../../reusables/header.dart';
import '../../reusables/loader.dart';
import '../../reusables/navigators.dart';
import 'student_information_screen.dart';
import 'students_screen_widgets.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

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
        child: BlocBuilder<FetchStudentBloc, FetchStudentState>(
          builder: (context, fsb) {
            if (fsb is FetchStudentProgress) {
              return const LoaderContainerWithMessage(
                message: "Please wait loading for data",
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
                      itemCount: fsb.dataList.length,
                      itemBuilder: (context, index) {
                        return StudentsTile(
                          action: () {
                            var selectedStudent = fsb.dataList.firstWhere((element) => element.id == index + 1);
                            pushSimple(
                              context,
                              StudentInformationScreen(student: selectedStudent),
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
                child: Text("Unable to get all table data"),
              );
            }
          },
        ),
      ),
    );
  }
}
