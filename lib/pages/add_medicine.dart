import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/add_medicine_container.dart';
import '../widgets/text_field.dart';
class AddMedicine extends StatelessWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("إضافة دواء",style: Theme.of(context).textTheme.headlineMedium,),
            ),
            AddMedicineContainer(
              column: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اسم الدواء",style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(child: CustomTextField(filteringTextInputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 \u0621-\u064A0-9 ]")),
                      keyboardType:TextInputType.text,hintText:"اكتب اسم الدواء")),
                ],
              ),),
          ],
      ),
    );
  }
}
