import 'package:class_mate_connect/mainApp/screens/classrooms/class_rooms.dart';
import 'package:class_mate_connect/mainApp/screens/students/students_screen.dart';
import 'package:class_mate_connect/mainApp/screens/subjects/subjects_screen.dart';
import 'package:flutter/material.dart';

List<String> dashboardTitleLists = [
  "Students",
  "Subjects",
  "Classrooms",
];
List<IconData> dashboardIconLists = [
  Icons.groups,
  Icons.menu_book,
  Icons.school,
];
List<Widget> catogoryScreens = [
  const StudentsScreen(),
  const SubjectsScreen(),
  const ClassRoomsScreen(),
];
