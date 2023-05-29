import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
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
  final _controller = PageController();
  /*late CircularBottomNavigationController _navigationController;
  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }*/
  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //double bottomNavBarHeight = size.height * 0.1;
    return Scaffold(
      body:SafeArea(
        child: PageView(
          controller: _controller,
          children: const [
            HomePage(),
          AddMedicine(),
          MedicinesPage(),
          NotificationsPage(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: _controller,
        items: const [
          RollingBottomBarItem(Icons.home, label: "رئيسيه"),
          RollingBottomBarItem(Icons.add, label: "إضافة"),
          RollingBottomBarItem(Icons.list, label: "دوائي"),
          RollingBottomBarItem(Icons.notifications, label: "الأشعارات"),
        ],
        color:blueColor ,
        activeItemColor: redColor,
        enableIconRotation: true,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
        },
      ),
      /* Stack(
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

      ),*/
    );
  }
}
