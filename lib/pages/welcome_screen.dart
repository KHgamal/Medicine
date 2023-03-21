import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants.dart';
import '../pages/home.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Timer _timer;
  late Timer navTimer;
  int currentPage = 0;
  final _pageViewController =  PageController();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds:2), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
       currentPage = 0;
      }

      _pageViewController.animateToPage(
        currentPage,
        duration:const Duration(milliseconds:400),
        curve: Curves.easeIn,
      );

  });
    navTimer = Timer.periodic(const Duration(seconds:10), (Timer timer) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    navTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
             TextButton(
              onPressed: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage())),
              style: TextButton.styleFrom(foregroundColor: Colors.black12),
               child:const Text(
               "Skip",
               style:  TextStyle(fontSize: 25),
             ),
            ),
            PageView.builder(
              controller: _pageViewController,
              itemCount:splashList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Image.asset(
                        splashList[index],
                        fit: BoxFit.fitWidth,
                        width: 220.0,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        padding:const EdgeInsets.symmetric(horizontal: 30.0,vertical:30 ),
                        child:const Text(
                         "Organize all of your pills in one place using the auto-complete function\n"
                             " get notifications to take your meds\n and receive reminders to fill your prescriptions.",
                         style: TextStyle(
                             color: Colors.grey,
                             letterSpacing: 1.2,
                             fontSize: 16.0,
                             height: 1.3),
                         textAlign: TextAlign.center,
                            ),
                      ),
                    )
                  ],
                );
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:const EdgeInsets.only(top: 70.0),
                  padding:const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      SmoothPageIndicator(
                          controller: _pageViewController,  // PageController
                          count:splashList.length,
                          // forcing the indicator to use a specific direction
                          textDirection: TextDirection.rtl,
                          effect: WormEffect(
                              dotColor:customColor5,
                              activeDotColor:customColor2
                          ),)
                    ],
                  ),
                )
              //  ),
            )
            // )
          ],
        ),
      ),
    );
  }
}
