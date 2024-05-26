import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/deleteBlocs/delete_registration_bloc.dart';
import 'colors.dart';
import 'navigators.dart';

Future<bool> showCustomAlertDialog(BuildContext context, int registrationId) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: const Text('Delete', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      content: const Text('Do you want to delete?', style: TextStyle(fontSize: 16)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('No', style: TextStyle(color: blueClr)),
        ),
        TextButton(
          onPressed: () {
            removeScreen(context);
            context.read<DeleteRegistrationBloc>().add(
                  DeleteRegistration(
                    registrationId: registrationId,
                  ),
                );
          },
          child: const Text('Yes', style: TextStyle(color: blueClr)),
        ),
      ],
    ),
  );
}
