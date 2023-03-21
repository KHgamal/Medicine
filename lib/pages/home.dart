import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:weekday_scroller/weekday_scroller.dart';

import '../widgets/medicine_list_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    double bottomNavBarHeight = size.height * 0.1;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [customColor1,customColor2,customColor3, customColor5],
          ),),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.22,
              width: size.width,
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:const[
                              Text(
                              '  تذكيرك اليومي بالدواء',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            /*Image.asset(
                              'assets/logo.png',
                              height: size.height * 0.15,
                            ),*/
                          ],
                        ),
                      ),
                       SizedBox(
                        height: size.height*0.02,
                      ),
                      WeekdayScroller(
                        selectedDay: selectedDay,
                        changeDay: (value) => setState(() {
                          selectedDay = value;
                        }),
                        backgroundColor: customColor1.withOpacity(0),
                        enableWeeknumberText: false,
                        weekdayTextColor:Colors.white,
                        digitsColor:Colors.white70,
                        selectedDigitColor:customColor1,
                        selectedBackgroundColor:Colors.white,
                      ),
                    ],
                  ),
                ),
            Padding(
              padding: EdgeInsets.only(
                bottom: bottomNavBarHeight,
                right: 12,
                left: 12,
              ),
              child: SizedBox(
                height: size.height * 0.65,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return MedicineListContainer(
                      size: size,
                      image: imagesList[index],
                      name: name[index],
                      nextDose: nextDose[index],
                    );
                  },
                  itemCount: imagesList.length,
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
