import 'package:flutter/material.dart';

import '../../models/class_room_model.dart';
import '../../reusables/sized_box.dart';
import '../../reusables/colors.dart';
import '../../reusables/rich_text.dart';

class ClassRoomsTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
        color: greyGradient,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          hb8,
          ListTile(
            onTap: action,
            title: CustomRichText(
              title: '${studentsList.name}\n',
              secondaryTitle: '${studentsList.layout}\n',
            ),
            trailing: CustomRichText(
              title: '${studentsList.size}\n',
              secondaryTitle: 'Seats\n',
            ),
          ),
        ],
      ),
    );
  }
}
