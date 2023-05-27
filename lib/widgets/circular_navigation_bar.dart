import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import '../constants.dart';

import '../pages/add_medicine.dart';
import '../pages/home.dart';
import '../pages/all_medicines.dart';
import '../pages/notifications.dart';


class CircularNavigationBar extends StatefulWidget {
  const CircularNavigationBar({super.key});

  @override
  State<CircularNavigationBar> createState() => _CircularNavigationBarState();
}

class _CircularNavigationBarState extends State<CircularNavigationBar> {
  int selectedPos = 0;
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "رئيسيه", customColor1,labelStyle: const TextStyle(fontSize: 15)),
    TabItem(Icons.add, "إضافة", customColor1,labelStyle: const TextStyle(fontSize: 15)),
    TabItem(Icons.list, "دوائي", customColor1,labelStyle: const TextStyle(fontSize: 15)),
    TabItem(Icons.notifications, "الأشعارات",customColor1,labelStyle: const TextStyle(fontSize: 15)),
  ]);
  List<Widget> screens = [
    const HomePage(),
    const AddMedicine(),
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
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(child: screens[selectedPos]),
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
    );
  }
}
