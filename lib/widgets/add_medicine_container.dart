import 'package:flutter/material.dart';

import '../constants.dart';

class AddMedicineContainer extends StatelessWidget {
  const AddMedicineContainer({Key? key, required this.child}) : super(key: key);
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration:const BoxDecoration(
        color:Colors.white,
      ),
      child:child,
    );
  }
}
