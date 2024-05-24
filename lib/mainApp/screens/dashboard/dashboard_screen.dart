import 'package:class_mate_connect/mainApp/reusables/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fetch_students_bloc.dart';
import '../../constants/lists/lists.dart';
import '../../reusables/sized_box.dart';
import 'dashboard_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchStudentBloc, FetchStudentState>(
      builder: (context, fsb) {
        if (fsb is FetchStudentProgress) {
          return const LoaderContainerWithMessage(message: "Loading");
        }
        if (fsb is FetchStudentSuccess) {
          debugPrint("students data: ${fsb.dataList.toString()}");
        }

        return const DashboardBody();
      },
    );
  }
}

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
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
