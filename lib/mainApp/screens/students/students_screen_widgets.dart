import 'package:flutter/material.dart';

import '../../models/students_model.dart';
import '../../reusables/colors.dart';

class StudentsTile extends StatelessWidget {
  const StudentsTile({
    super.key,
    required this.action,
    required this.accountTypeList,
    required this.selectedId,
  });
  final StudentModel accountTypeList;
  final void Function() action;
  final int selectedId;
  @override
  Widget build(BuildContext context) {
    final isSelected = selectedId == accountTypeList.id;
    final borderColor = isSelected ? primaryColor : black.withOpacity(0.15);
    final borderWidth = isSelected ? 2.0 : 1.0;
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth, color: borderColor),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: action,
            title: Text(
              accountTypeList.name,
              style: TextStyle(
                color: isSelected ? primaryColor : black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
