import 'package:flutter/material.dart';
import '../constants.dart';

class NotificationsSettingsElement extends StatefulWidget {
  const NotificationsSettingsElement(
      {super.key,
      required this.size,
      required this.title,
      required this.subTitle,
      required this.checkBox});
  final Size size;
  final String title;
  final String subTitle;
  final bool checkBox;

  @override
  State<NotificationsSettingsElement> createState() =>
      _NotificationsSettingsElementState();
}

class _NotificationsSettingsElementState
    extends State<NotificationsSettingsElement> {
  bool isChecked = false;
  Color? fillcolor = customColor2;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: SizedBox(
        width: widget.size.width,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.subTitle,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              if (widget.checkBox)
                Checkbox(
                    checkColor: customColor5,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? valueKey) {
                      setState(() {
                        isChecked = valueKey!;
                      });
                    })
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return darkBlue;
    }
    return blueColor;
  }
}
