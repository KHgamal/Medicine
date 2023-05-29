import 'package:flutter/material.dart';
import 'package:untitled1/constants.dart';

import '../widgets/medicine_list_container.dart';

class MedicinesPage extends StatefulWidget {
  const MedicinesPage({super.key});

  @override
  State<MedicinesPage> createState() => _MedicinesPageState();
}

class _MedicinesPageState extends State<MedicinesPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [customColor1, customColor2, customColor3, customColor5],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            // bottom: size.height * 0.1,
            right: 12,
            left: 12,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return MedicineListContainer(
                        index: index,
                        size: size,
                        image: details[index]['imagesList'],
                        name: details[index]['name'],
                        nextDose: details[index]['nextDose'],
                        onPressed: (context) {
                          setState(() {
                            details.removeAt(index);
                          });
                        },
                        concentration: details[index]['concentration'],
                        firstDose: details[index]['first dose'],
                        secondDose: details[index]['second dose'],
                      );
                    },
                    itemCount: details.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
