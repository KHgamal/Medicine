import 'package:flutter/cupertino.dart';
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
    required this.nextDose,
  });
  final Size size;
  final String image;
  final String name;
  final String nextDose;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        //height: 120,                           //?
        //width: size.width * 0.6,
        child: Material(
          color: Colors.white54,// ? the same as container so why bother
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          elevation: 5,
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MedicineDetails())),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: ((context) {}), //deleteFunction,
                    icon: Icons.delete,
                    backgroundColor: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(12),
                  )
                ],
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal:8),
                decoration: const BoxDecoration(
                  color: Colors.white38,
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
          ),
        ),
      ),
    );
  }
}
