import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../constants.dart';
import '../pages/medicine_details.dart';

class MedicineListContainer extends StatelessWidget {
  const MedicineListContainer({
    super.key,
    required this.size,
    required this.image,
    required this.name,
    required this.nextDose,required this.onPressed, required this.index,
  });
  final Size size;
  final String image;
  final String name;
  final String nextDose;
  final void Function(BuildContext)? onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MedicineDetails(index: index,))),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed:onPressed, //deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
             borderRadius: BorderRadius.circular(15),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal:8),
          decoration: const  BoxDecoration(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.end,
            children: [
             IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                color: customColor2,
              ),
             SizedBox(
                width: size.width * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 23),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Text(
                          'الجرعه التاليه : $nextDose ',
                          style:
                              TextStyle(fontSize: 18, color: customColor),
                        ),
                        const SizedBox(width: 5,),
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
                    SizedBox(height: size.height*0.03),
                    Image.asset(
                     image,
                     height: 40,
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
