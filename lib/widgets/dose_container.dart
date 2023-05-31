import 'package:flutter/material.dart';

class DoseContainer extends StatelessWidget {
  const DoseContainer({
    Key? key,
    required this.dose,
    required this.color,
    required this.fontSize, required this.fontColor,
  }) : super(key: key);

  final String dose;
  final Color color;
  final double fontSize;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dose,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
