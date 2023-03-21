import 'package:flutter/material.dart';
import 'package:untitled1/constants.dart';

import '../widgets/bottom_sheet.dart';
import '../widgets/medicine_list_container.dart';

class MedicinesPage extends StatelessWidget {
  const MedicinesPage({super.key});

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
            colors: [customColor1,customColor2,customColor3, customColor5],
          ),),
        child:
      Padding(
          padding: EdgeInsets.only(
           // bottom: size.height * 0.1,
            right: 12,
            left: 12,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return MedicineListContainer(
                    size: size,
                    image: imagesList[index],
                    name: name[index],
                    nextDose: nextDose[index],
                  );
                },
                itemCount: imagesList.length,
              ),

              ],
            ),
          ),

        ),
      ),
    );
  }
}
