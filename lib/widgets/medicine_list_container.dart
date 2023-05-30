import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../constants.dart';
import '../pages/medicine_details.dart';
import 'dose_container.dart';

class MedicineListContainer extends StatelessWidget {
  const MedicineListContainer({
    super.key,
    required this.size,
    required this.image,
    required this.name,
    required this.nextDose,
    required this.onPressed,
    required this.index,
    required this.concentration,
    required this.firstDose,
    required this.secondDose,
  });
  final Size size;
  final String image;
  final String name;
  final String concentration;
  final String nextDose;
  final String firstDose;
  final String secondDose;
  final void Function(BuildContext)? onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MedicineDetails(
                index: index,
              ))),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: onPressed, //deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(15),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                //color:blueColor,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: IntakeContainer(size: size),
              ),
              /*const SizedBox(
                height: 12,
              ),*/
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      DoseContainer(dose: firstDose, color: redColor, fontSize: 12,),
                      const SizedBox(
                        height: 10,
                      ),
                      DoseContainer(dose: secondDose, color: redColor, fontSize: 12,)
                    ],
                  ),
                  /*IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    color: redColor,
                  ),*/
                  const Expanded(
                    child: SizedBox(
                        // width: size.width * 0.03,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontSize: 23),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          concentration,
                          style: TextStyle(
                            fontSize: 12,
                            color: blueColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'الجرعه التاليه : $nextDose ',
                              style: TextStyle(
                                fontSize: 18,
                                color: darkBlue,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(Icons.alarm)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.03),
                        Image.asset(
                          image,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class IntakeContainer extends StatefulWidget {
  const IntakeContainer({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  State<IntakeContainer> createState() => _IntakeContainerState();
}

class _IntakeContainerState extends State<IntakeContainer> {
  bool isChecked = false;
  Color? fillcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      //elevation: 5,
      child: SizedBox(
        //width: widget.size.width,
        //height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? valueKey) {
                    setState(() {
                      isChecked = valueKey!;
                    });
                  }),
              Text(
                isChecked ? '!Intake completed' : '?Did you take your medicine',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isChecked ? blueColor : redColor,
                ),
              )
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
      return isChecked ? redColor : blueColor;
    }
    return isChecked ? blueColor : redColor;
  }
}
