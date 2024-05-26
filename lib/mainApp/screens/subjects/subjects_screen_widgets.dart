import 'package:flutter/material.dart';

import '../../models/subjects_model.dart';
import '../../reusables/colors.dart';
import '../../reusables/rich_text.dart';
import '../../reusables/sized_box.dart';

class SubjectsTile extends StatefulWidget {
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
  State<SubjectsTile> createState() => _SubjectsTileState();
}

class _SubjectsTileState extends State<SubjectsTile> {
  bool isTaped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: isTaped ? grey.withOpacity(0.8) : greyShade,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      height: 80,
      child: Column(
        children: [
          hb8,
          ListTile(
            onTap: () {
              setState(() {
                isTaped = !isTaped;
              });
              widget.action();
            },
            title: CustomRichText(
              title: '${widget.studentsList.name}\n',
              secondaryTitle: '${widget.studentsList.teacher}\n',
            ),
            trailing: CustomRichText(
              title: '${widget.studentsList.credits}\n',
              secondaryTitle: 'Credits\n',
            ),
          ),
        ],
      ),
    );
  }
}
