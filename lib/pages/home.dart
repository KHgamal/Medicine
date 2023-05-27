import 'package:flutter/cupertino.dart';
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:const EdgeInsets.all(16),
                color: blueColor,
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children:[
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children:const [
                               Text(
                                 'تذكيرك اليومي بالدواء',
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 28,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                               Text(
                                 '22 مايو 2023',
                                 style: TextStyle(
                                   color: Colors.white70,
                                   fontSize:23,
                                   //fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ],
                           ),
                          ],
                        ),
                        WeekdayScroller(
                          selectedDay: selectedDay,
                          changeDay: (value) => setState(() {
                            selectedDay = value;
                          }),
                          backgroundColor: Colors.transparent,
                          enableWeeknumberText: false,
                          weekdays: ["الاثنين",'الثلاثاء','الاربعاء','الخميس','الجمعة','السبت','الاحد',],
                          weekdayTextColor:Colors.white70,

                          digitsColor:Colors.white70,

                          selectedDigitColor:blueColor,

                          selectedBackgroundColor:Colors.white,
                        ),
                      ],
                    ),
              ),
              SizedBox(
                child: ListView.builder(
                  padding:const EdgeInsets.all(12) ,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: MedicineListContainer(
                        size: size,
                        image: details[index]['imagesList'],
                        name: details[index]['name'],
                        nextDose:details[index]['nextDose'], onPressed:(context)=>setState(() {
                        details.removeAt(index);
                      }), index: index,
                      ),
                    );
                  },
                  itemCount:details.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
