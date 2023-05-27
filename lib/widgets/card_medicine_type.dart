import 'package:flutter/material.dart';
class MedicineTypesCard extends StatelessWidget {
  const MedicineTypesCard({Key? key, required this.image, required this.color, required this.text}) : super(key: key);
final String image;
final String text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),elevation:7,
      color: color,
       child:Column(
         children: [
           Image.asset(image ,height:50,width: 100,),
           Text(text)
         ],
       ) ,
    );
  }
}
