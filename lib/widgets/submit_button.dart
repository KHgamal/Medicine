import 'package:flutter/material.dart';
import 'package:untitled1/constants.dart';
class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key,required this.onPressed}) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation:5,
        backgroundColor:customColor2,
        foregroundColor:Colors.white ,
        textStyle: const TextStyle(
          fontSize:25,
        ),
      ),
      onPressed: onPressed, child: const Text("أضف لجدولك"),);
  }
}
