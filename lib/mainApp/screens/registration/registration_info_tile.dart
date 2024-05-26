import 'package:flutter/material.dart';

import '../../reusables/colors.dart';

class RegistrationInfoTile extends StatelessWidget {
  final String title;
  final String trailing;
  final String thirdTitle;
  final String secondTitle;
  const RegistrationInfoTile({
    super.key,
    required this.title,
    required this.trailing,
    required this.thirdTitle,
    required this.secondTitle,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height * 0.11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: greyShade,
      ),
      child: Center(
        child: ListTile(
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 15),
              ),
              Text(secondTitle),
              Text(thirdTitle),
            ],
          ),
          trailing: Text(trailing),
        ),
      ),
    );
  }
}
