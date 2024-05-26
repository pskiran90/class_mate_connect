import 'package:flutter/material.dart';

import '../../reusables/sized_box.dart';
import '../../models/students_model.dart';
import '../../reusables/colors.dart';
import '../../reusables/rich_text.dart';

class StudentsTile extends StatelessWidget {
  const StudentsTile({
    super.key,
    required this.action,
    required this.studentsList,
    required this.selectedId,
  });
  final StudentModel studentsList;
  final void Function() action;
  final int selectedId;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
        color: greyShade,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Column(
          children: [
            hb8,
            ListTile(
              onTap: action,
              title: CustomRichText(
                title: '${studentsList.name}\n',
                secondaryTitle: '${studentsList.email}\n',
              ),
              trailing: Text(
                "Age: ${studentsList.age}",
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
