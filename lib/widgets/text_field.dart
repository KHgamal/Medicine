import 'package:flutter/material.dart';
import 'package:flutter/services.dart.';

import '../constants.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField( {Key? key, required this.hintText, required this.keyboardType,
    this.filteringTextInputFormatter, this.prefixIcon, required this.controller,
    required this.readOnly, this.onTap}) : super(key: key);
 final String hintText;
  final dynamic  prefixIcon ;
 final  TextInputType keyboardType;
 final dynamic filteringTextInputFormatter;
  final  TextEditingController controller;
  final bool readOnly;
  final dynamic onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      readOnly:readOnly,
      onTap: onTap,
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
        prefixIconColor:redColor,
        prefixIcon:prefixIcon,
        hintText: hintText,
      ),
    );
  }
}
