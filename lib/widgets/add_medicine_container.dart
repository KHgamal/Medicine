import 'package:flutter/material.dart';
class AddMedicineContainer extends StatelessWidget {
  const AddMedicineContainer({Key? key, required this.column}) : super(key: key);
final Column column;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      child:column,
    );
  }
}
