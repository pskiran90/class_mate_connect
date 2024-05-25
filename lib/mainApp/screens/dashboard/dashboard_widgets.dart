import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/sized_box.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 30,
            ),
            hb8,
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CatogoryTile extends StatelessWidget {
  const CatogoryTile({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
    required this.action,
    required this.selectedName,
  });

  final IconData icon;
  final String title;
  final String count;
  final String selectedName;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final isSelected = selectedName == title;
    final backgroundColor = isSelected ? primaryColor.withOpacity(0.8) : secondaryColor;
    final textColor = isSelected ? secondaryColor : primaryColor;
    final borderColor = isSelected ? secondaryColor : primaryColor.withOpacity(0.40);

    return InkWell(
      onTap: action,
      child: Container(
        height: size.height * 0.18,
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hw10,
              Icon(
                icon,
                size: 40,
                color: isSelected ? white : black,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                count,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              hw10
            ],
          ),
        ),
      ),
    );
  }
}
