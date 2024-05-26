import 'package:flutter/material.dart';

import '../../models/subjects_model.dart';
import '../../reusables/colors.dart';
import '../../reusables/rich_text.dart';
import '../../reusables/sized_box.dart';

class SubjectsTile extends StatelessWidget {
  const SubjectsTile({
    super.key,
    required this.action,
    required this.studentsList,
    required this.selectedId,
  });
  final SubjectsModel studentsList;
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
      height: 80,
      child: Column(
        children: [
          hb8,
          ListTile(
            contentPadding: const EdgeInsets.only(
              top: 6,
              left: 8,
              right: 8,
            ),
            onTap: () {
              action();
            },
            title: CustomRichText(
              title: '${studentsList.name}\n',
              secondaryTitle: '${studentsList.teacher}\n',
            ),
            trailing: CustomRichText(
              title: '${studentsList.credits}\n',
              secondaryTitle: 'Credits\n',
            ),
          ),
        ],
      ),
    );
  }
}
