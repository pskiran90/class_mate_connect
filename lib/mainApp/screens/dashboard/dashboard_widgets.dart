import 'package:flutter/material.dart';

import '../../constants/strings/app_asset_constants.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_card.dart';
import '../../reusables/sized_box.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return CustomCard(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Start Learning",
              style: TextStyle(fontSize: 28, color: white, fontWeight: FontWeight.bold),
            ),
            hb8,
            Image.asset(
              height: size.height * 0.2,
              width: size.width,
              AppAssetConstants.learnBg,
              fit: BoxFit.scaleDown,
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
                color: isSelected ? white : primary,
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
