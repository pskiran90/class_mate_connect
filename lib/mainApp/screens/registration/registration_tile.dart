import 'package:flutter/material.dart';

import '../../models/registration_model.dart';
import '../../reusables/sized_box.dart';
import '../../reusables/colors.dart';

class RegistrationTile extends StatelessWidget {
  const RegistrationTile({
    super.key,
    required this.action,
    required this.registrationList,
    required this.selectedId,
  });
  final RegistrationModel registrationList;
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
      child: Column(
        children: [
          hb8,
          ListTile(
            onTap: action,
            title: Text(
              "Registration Id: #${registrationList.id}",
              style: const TextStyle(fontSize: 15),
            ),
            trailing: const Icon(
              Icons.chevron_right,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
