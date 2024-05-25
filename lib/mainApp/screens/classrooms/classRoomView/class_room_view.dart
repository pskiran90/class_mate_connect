import 'package:flutter/material.dart';

import '../../../models/conference_room_model.dart';
import '../../../reusables/colors.dart';

class ClassRoomView extends StatelessWidget {
  final ConferenceRoomModel classRoomModel;
  const ClassRoomView({
    super.key,
    required this.classRoomModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: black),
            ),
            child: const Icon(
              Icons.airline_seat_recline_normal,
            ),
          );
        },
        itemCount: classRoomModel.size,
      ),
    );
  }
}
