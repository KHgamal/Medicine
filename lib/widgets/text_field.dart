import 'package:flutter/material.dart';
import 'package:flutter/services.dart.';
class CustomTextField extends StatelessWidget {
  const CustomTextField( {Key? key, required this.hintText, required this.keyboardType, this.filteringTextInputFormatter}) : super(key: key);
 final String hintText;
 final  TextInputType keyboardType;
 final dynamic filteringTextInputFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        filteringTextInputFormatter,
      ],
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يجب ادخال قيمة';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
