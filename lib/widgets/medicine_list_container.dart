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
              IntakeContainer(size: size),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      image,
                      height: 40,
                    ),
                    const SizedBox(width:5,),
                    Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontSize: 23),
                        ),
                        Text(
                          concentration,
                          style: TextStyle(
                            fontSize: 12,
                            color:redColor,
                          ),
                        ),
                        Text(
                          'الجرعه التاليه : $nextDose ',
                          style: TextStyle(
                            fontSize: 18,
                            color: darkBlue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width:5,),
                    Column(
                      children: [
                        DoseContainer(dose: firstDose),
                        const SizedBox(height: 5,),
                        DoseContainer(dose: secondDose)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:blueColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dose,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
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
  Color? fillColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
            isChecked ? 'تم أخذ الدواء' : 'لم يتم أخذ الدواء حتى الان',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isChecked ? blueColor : redColor,
            ),
          ),
            Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? valueKey) {
                  setState(() {
                    isChecked = valueKey!;
                  });
                }),
          ],
        ),
        const Divider(color: Colors.black26,thickness:1.2,)
      ],
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
