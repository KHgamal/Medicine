import 'package:flutter/material.dart';
class DropDown extends StatefulWidget {
 const DropDown({Key? key, required this.initialText, required this.list}) : super(key: key);
 final String initialText;
 final List list;
 static String? selectedItem;
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<DropdownMenuItem<String>> _createList(List list) {
    return list
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
        value: e,
        child: Text(e),
      ),
    ) .toList();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
        ),
        items: _createList(widget.list),
        hint: Text(widget.initialText,style: TextStyle(fontWeight: FontWeight.bold,fontSize:10),),
        value: DropDown.selectedItem,
        validator: (value) => value == null ? 'يجب ادخال قيمة' : null,
        onChanged: (String? value) => setState(() {
          DropDown.selectedItem = value ?? "";
        }),
      ),
    );
  }
}
