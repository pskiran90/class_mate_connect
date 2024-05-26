import 'package:class_mate_connect/mainApp/models/students_model.dart';
import 'package:class_mate_connect/mainApp/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fetchBlocs/fetch_registration_bloc.dart';
import '../../bloc/fetchBlocs/fetch_students_bloc.dart';
import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/globals.dart';
import '../../reusables/header.dart';
import '../../reusables/loader.dart';
import '../../reusables/navigators.dart';
import '../../reusables/sized_box.dart';
import 'newRegistration/new_registration_view.dart';
import 'registration_info_screen.dart';
import 'registration_tile.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pushSimple(context, const DashboardScreen());
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<FetchStudentBloc, FetchStudentState>(
          builder: (context, fsb) {
            return BlocBuilder<FetchRegistrationBloc, FetchRegistrationState>(
              builder: (context, frb) {
                if (frb is FetchRegistrationProgress) {
                  return const LoaderContainerWithMessage(
                    message: "Loading registration data",
                  );
                } else if (frb is FetchRegistrationSuccess && fsb is FetchStudentSuccess) {
                  return Column(
                    children: [
                      const Header(
                        title: "Registrations",
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: frb.registrationList.length,
                          itemBuilder: (context, index) {
                            var registration = frb.registrationList[index];
                            StudentModel studentInfo = fsb.studentsList.firstWhere(
                              (student) => student.id == registration.student,
                            );
                            var lastRegistration = frb.registrationList.isNotEmpty ? frb.registrationList.last : null;
                            GlobalNotifier().regIdNotifier.value = lastRegistration!.id;
                            return RegistrationTile(
                              action: () {
                                pushSimple(
                                  context,
                                  RegistrationInformationScreen(
                                    registrationModel: registration,
                                    student: studentInfo,
                                  ),
                                );
                              },
                              registrationList: registration,
                              selectedId: index + 1,
                            );
                          },
                        ),
                      ),
                      CustomButton(
                        titleClr: blueClr,
                        title: "New Registration",
                        buttonClr: blueShade.withOpacity(0.15),
                        onPressed: () {
                          pushSimple(
                            context,
                            const NewRegistrationScreen(),
                          );
                        },
                      ),
                      hb12
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
