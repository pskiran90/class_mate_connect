import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fetchBlocs/fetch_classrooms_bloc.dart';
import '../../bloc/fetchBlocs/fetch_subject_bloc.dart';
import '../../reusables/header.dart';
import '../../main_app.dart';
import '../../reusables/loader.dart';
import '../../reusables/navigators.dart';
import 'class_room_information_screen.dart';
import 'class_room_widgets.dart';

class ClassRoomsScreen extends StatelessWidget {
  const ClassRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pushByReplacing(context, const MainApp());
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<FetchSubjectsBloc, FetchSubjectsState>(
          builder: (context, fsb) {
            return BlocBuilder<FetchClassRoomBloc, FetchClassRoomState>(
              builder: (context, fcb) {
                if (fcb is FetchClassRoomProgress) {
                  return const LoaderContainerWithMessage(
                    message: "Please wait loading Class Room data",
                  );
                } else if (fcb is FetchClassRoomSuccess && fsb is FetchSubjectsSuccess) {
                  return Column(
                    children: [
                      const Header(
                        title: "Class Rooms",
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: fcb.dataList.length,
                          itemBuilder: (context, index) {
                            return ClassRoomsTile(
                              action: () {
                                var selectedClassRoom = fcb.dataList.firstWhere((element) => element.id == index + 1);
                                pushSimple(
                                  context,
                                  ClassRoomInformationScreen(selectedClassRoomId: selectedClassRoom.id, subjects: fsb.subjects),
                                );
                              },
                              studentsList: fcb.dataList[index],
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
            );
          },
        ),
      ),
    );
  }
}
