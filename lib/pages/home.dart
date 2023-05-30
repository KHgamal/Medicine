import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../constants.dart';
import 'package:weekday_scroller/weekday_scroller.dart';

import '../widgets/medicine_list_container.dart';
import 'dart:ui' as ui;

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
     initializeDateFormatting();
    String date = DateFormat.yMMMMd("ar_QA").format(DateTime.now());
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection:ui.TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color:const Color(0xff70c5e2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'تذكيرك اليومي بالدواء',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                date,
                                style: TextStyle(
                                  color: redColor,
                                  fontSize: 23,
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
                        weekdays: const [
                          "الاثنين",
                          'الثلاثاء',
                          'الاربعاء',
                          'الخميس',
                          'الجمعة',
                          'السبت',
                          'الاحد',
                        ],
                        weekdayTextColor: Colors.white70,
                        digitsColor: Colors.white70,
                        selectedDigitColor: blueColor,
                        selectedBackgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: ListView.builder(
                    physics:const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: MedicineListContainer(
                          size: size,
                          image: details[index]['imagesList'],
                          name: details[index]['name'],
                          nextDose: details[index]['nextDose'],
                          onPressed: (context) => setState(() {
                            details.removeAt(index);
                          }),
                          index: index,
                          concentration: details[index]['concentration'],
                          firstDose: details[index]['first dose'],
                          secondDose: details[index]['second dose'],
                        ),
                      );
                    },
                    itemCount: details.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
