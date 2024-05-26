import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color titleClr;
  final Color buttonClr;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.titleClr,
    required this.buttonClr,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 60,
      width: size.width * 0.6,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            buttonClr,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: titleClr,
          ),
        ),
      ),
    );
  }
}
