import 'package:flutter/material.dart';

import '../../constants/lists/lists.dart';
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
              const Expanded(
                flex: 3,
                child: DashboardCard(),
              ),
              hb10,
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: dashboardTitleLists.length,
                    itemBuilder: (context, index) {
                      String titleName = dashboardTitleLists[index];
                      IconData iconName = dashboardIconLists[index];
                      return CatogoryTile(
                        count: "5",
                        key: Key(titleName),
                        selectedName: selectedMenuName,
                        title: titleName,
                        action: () {
                          changeMenuIndex(titleName);
                          navigateToScreen(index);
                        },
                        icon: iconName,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
