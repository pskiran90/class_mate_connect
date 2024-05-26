import 'package:flutter/material.dart';

import '../../../models/conference_room_model.dart';
import '../../../models/subjects_model.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/navigators.dart';
import '../../subjects/subjects_screen.dart';

class SubjectContainer extends StatelessWidget {
  final List<SubjectsModel> subjectsList;
  final ConferenceRoomModel roomModel;

  const SubjectContainer({
    super.key,
    required this.roomModel,
    required this.subjectsList,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    String subjectName = "Add subject";
    if (roomModel.subject != 0) {
      final matchingSubject = subjectsList.firstWhere(
        (element) => element.id == roomModel.subject,
      );
      subjectName = matchingSubject.name;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      width: size.width - 16,
      height: 66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: greyShade,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subjectName,
            style: const TextStyle(fontSize: 16),
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                greenShade,
              ),
            ),
            onPressed: () {
              pushSimple(
                context,
                SubjectsScreen(
                  roomId: roomModel.id,
                  isRegistration: false,
                  isSubjectChangable: true,
                ),
              );
            },
            child: Text(
              roomModel.subject != 0 ? "Change" : "Add",
              style: const TextStyle(
                color: greenClr,
              ),
            ),
          )
        ],
      ),
    );
  }
}
