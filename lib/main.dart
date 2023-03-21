import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../constants.dart';
import '../pages/welcome_screen.dart';

import 'pages/medicine_details.dart';
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
          50: Color(0xff31275c),
          100: Color(0xff31275c),
          200: Color(0xff31275c),
          300: Color(0xff31275c),
          400: Color(0xff31275c),
          500: Color(0xff31275c),
          600: Color(0xff31275c),
          700: Color(0xff31275c),
          800: Color(0xff31275c),
          900: Color(0xff31275c),
        },);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor:const Color(0xffE4E5E8),
          hintStyle:const TextStyle(fontWeight: FontWeight.bold,fontSize:15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide( color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide( color: Colors.black12),
          ),
        )
      ),
      home:const Directionality(
          textDirection: TextDirection.rtl,
          child:CircularNavigationBar()),
    );
  }
}



