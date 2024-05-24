import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fetch_students_bloc.dart';
import '../../reusables/loader.dart';
import 'students_screen_widgets.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students Information"
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<FetchStudentBloc, FetchStudentState>(
          builder: (context, fsb) {
            if (fsb is FetchStudentProgress) {
              return const LoaderContainerWithMessage(message: "Loading");
            }
            if (fsb is FetchStudentSuccess) {
              debugPrint("students data: ${fsb.dataList.toString()}");
            }

            return (fsb is FetchStudentProgress)
                ? const LoaderContainerWithMessage(message: "Please wait loading for data")
                : (fsb is FetchStudentSuccess)
                    ? ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: fsb.dataList.length,
                        itemBuilder: (context, index) {
                          return StudentsTile(
                            action: () {},
                            accountTypeList: fsb.dataList[index],
                            selectedId: index + 1,
                          );
                        },
                      )
                    : const Center(
                        child: Text("Unable to get all table data"),
                      );
          },
        ),
      ),
    );
  }
}
