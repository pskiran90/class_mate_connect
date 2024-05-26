import 'package:flutter/material.dart';

import '../../reusables/sized_box.dart';
import '../../models/students_model.dart';
import '../../reusables/colors.dart';
import '../../reusables/rich_text.dart';

class StudentsTile extends StatefulWidget {
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
  State<StudentsTile> createState() => _StudentsTileState();
}

class _StudentsTileState extends State<StudentsTile> {
  bool isTaped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: isTaped ? grey.withOpacity(0.8) : greyShade,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
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
              secondaryTitle: '${widget.studentsList.email}\n',
            ),
            trailing: Text(
              "Age: ${widget.studentsList.age}",
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
