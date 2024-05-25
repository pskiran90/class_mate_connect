import 'package:flutter/material.dart';

import '../../constants/lists/lists.dart';
import '../../reusables/colors.dart';
import '../../reusables/sized_box.dart';
import 'dashboard_widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedMenuName = '';

  @override
  void initState() {
    super.initState();
    if (dashboardTitleLists.isNotEmpty) {
      selectedMenuName = dashboardTitleLists[0];
    }
  }

  void changeMenuIndex(String selectName) {
    setState(() {
      selectedMenuName = selectName;
    });
  }

  void navigateToScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => catogoryScreens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              hb20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hello,\n',
                          style: TextStyle(
                            color: black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Good Morning',
                          style: TextStyle(
                            color: black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  )
                ],
              ),
              hb20,
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    Color cardColor = dashboardCardColors[index % dashboardCardColors.length];
                    return GestureDetector(
                      onTap: () => navigateToScreen(index),
                      child: DashboardCard(
                        color: cardColor,
                        icon: dashboardIconLists[index],
                        title: dashboardTitleLists[index],
                      ),
                    );
                  },
                  itemCount: dashboardTitleLists.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
