import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import '../constants.dart';

import '../pages/home.dart';
import '../pages/medicines.dart';
import '../pages/notifications.dart';
import 'bottom_sheet.dart';


class CircularNavigationBar extends StatefulWidget {
  const CircularNavigationBar({super.key});

  @override
  State<CircularNavigationBar> createState() => _CircularNavigationBarState();
}

class _CircularNavigationBarState extends State<CircularNavigationBar> {
  int selectedPos = 0;
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "رئيسيه", customColor1,
        labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.list, "دوائي", customColor1, circleStrokeColor: Colors.white),
    TabItem(Icons.notifications, "الأشعارات", customColor1),
  ]);
  List<Widget> screens = [
    const HomePage(),
    const MedicinesPage(),
    const NotificationsPage(),
  ];
  late CircularBottomNavigationController _navigationController;
  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bottomNavBarHeight = size.height * 0.1;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding:EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom+8 ),
              child:screens[selectedPos],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child:CircularBottomNavigation(
                  tabItems,
                  controller: _navigationController,
                  selectedPos: selectedPos,
                  barHeight: bottomNavBarHeight,
                  barBackgroundColor: Colors.white,
                  backgroundBoxShadow: const <BoxShadow>[
                    BoxShadow(color: Colors.black45, blurRadius: 10.0),
                  ],
                  animationDuration: const Duration(milliseconds: 300),
                  selectedCallback: (int? selectedPos) {
                    setState(() {
                      this.selectedPos = selectedPos ?? 0;
                    });
                  },
                ), ),
            /*SizedBox(
              height: double.infinity,
                child: screens[selectedPos]),*/
           /* CircularBottomNavigation(
              tabItems,
              controller: _navigationController,
              selectedPos: selectedPos,
              barHeight: bottomNavBarHeight,
              barBackgroundColor: Colors.white,
              backgroundBoxShadow: const <BoxShadow>[
                BoxShadow(color: Colors.black45, blurRadius: 10.0),
              ],
              animationDuration: const Duration(milliseconds: 300),
              selectedCallback: (int? selectedPos) {
                setState(() {
                  this.selectedPos = selectedPos ?? 0;
                });
              },
            ),*/
          ],
        ),
       /*floatingActionButtonLocation: FloatingActionButtonLocation.endTop ,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FloatingActionButton.small(onPressed: ()=>modalBottomSheet(context),backgroundColor: Colors.white60,foregroundColor: customColor2,child:
          const Icon(Icons.add),),
        ),*/
      ),
    );
  }
}
