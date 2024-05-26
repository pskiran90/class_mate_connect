import 'package:class_mate_connect/mainApp/reusables/colors.dart';
import 'package:flutter/material.dart';

class NewRegistrationTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const NewRegistrationTile({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: greyShade,
        borderRadius: BorderRadius.circular(8),
      ),
      height: size.height * 0.1,
      width: size.width,
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
