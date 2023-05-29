import 'package:flutter/material.dart';
import '../constants.dart';

import 'widgets/circular_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    MaterialColor themeColor =const  MaterialColor(0xff31275c,
        <int, Color>{
          50: Color(0xff00afd1),
          100: Color(0xff00afd1),
          200: Color(0xff00afd1),
          300: Color(0xff00afd1),
          400: Color(0xff00afd1),
          500: Color(0xff00afd1),
          600: Color(0xff00afd1),
          700:Color(0xff00afd1),
          800:Color(0xff00afd1),
          900:Color(0xff00afd1),
        },);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeColor,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:const EdgeInsets.only(right: 8),
          hintStyle:const TextStyle(fontSize:15,color: Colors.black26,fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide( color: blueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide( color: blueColor),
          ),
        )
      ),
      home:const Directionality(
          textDirection: TextDirection.rtl,
          child:CircularNavigationBar()),
    );
  }
}



