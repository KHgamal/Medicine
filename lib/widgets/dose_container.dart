import 'package:flutter/material.dart';

class DoseContainer extends StatelessWidget {
  const DoseContainer({
    Key? key,
    required this.dose,
    required this.color, required this.fontSize,
  }) : super(key: key);

  final String dose;
  final Color color;
  final double fontSize;

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
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
