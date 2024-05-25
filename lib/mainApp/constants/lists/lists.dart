import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../screens/classrooms/class_rooms.dart';
import '../../screens/students/students_screen.dart';
import '../../screens/subjects/subjects_screen.dart';
import '../../screens/registration/registration_screen.dart';

List<String> dashboardTitleLists = [
  "Students",
  "Subjects",
  "Classrooms",
  "Registration",
];
List<IconData> dashboardIconLists = [
  Icons.school,
  Icons.book,
  Icons.door_back_door,
  Icons.edit,
];
List<Widget> catogoryScreens = [
  const StudentsScreen(),
  const SubjectsScreen(),
  const ClassRoomsScreen(),
  const RegistrationScreen(),
];
final List<Color> dashboardCardColors = [
  greenIconClr,
  blueIconClr,
  redIconColor,
  yellowIconClr,
];
