import 'package:flutter/material.dart';

import '../../models/class_room_model.dart';
import '../../reusables/sized_box.dart';
import '../../reusables/colors.dart';
import '../../reusables/rich_text.dart';

class ClassRoomsTile extends StatefulWidget {
  const ClassRoomsTile({
    super.key,
    required this.action,
    required this.studentsList,
    required this.selectedId,
  });
  final ClassRoomModel studentsList;
  final void Function() action;
  final int selectedId;

  @override
  State<ClassRoomsTile> createState() => _ClassRoomsTileState();
}

class _ClassRoomsTileState extends State<ClassRoomsTile> {
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
              secondaryTitle: '${widget.studentsList.layout}\n',
            ),
            trailing: CustomRichText(
              title: '${widget.studentsList.size}\n',
              secondaryTitle: 'Seats\n',
            ),
          ),
        ],
      ),
    );
  }
}
