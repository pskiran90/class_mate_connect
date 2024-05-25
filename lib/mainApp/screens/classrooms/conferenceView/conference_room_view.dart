import 'package:flutter/material.dart';

import '../../../models/conference_room_model.dart';
import '../../../reusables/colors.dart';

class ConferenceRoomView extends StatelessWidget {
  final ConferenceRoomModel classRoomModel;

  const ConferenceRoomView({
    Key? key,
    required this.classRoomModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    int halfSize = classRoomModel.size ~/ 2;
    bool isOdd = classRoomModel.size % 2 != 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    halfSize,
                    (index) => const Icon(
                      Icons.airline_seat_recline_normal,
                      size: 36,
                    ),
                  ),
                ),
              ),
              Container(
                color: greyGradient,
                width: size.width * 0.6,
                height: size.height,
              ),
              SizedBox(
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    halfSize + (isOdd ? 1 : 0),
                    (index) => Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(3.14159),
                      child: const Icon(
                        Icons.airline_seat_recline_normal,
                        size: 36,
                      ),
                    ),
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
