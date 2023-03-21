import 'package:flutter/material.dart';
class MedicineTypesCard extends StatelessWidget {
  const MedicineTypesCard({Key? key, required this.image, required this.color}) : super(key: key);
final String image;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),elevation:7,
      color: color,
       child:Padding(
         padding: const EdgeInsets.all(8.0),
         child: Image.asset(image),
       ) ,
    );
  }
}
