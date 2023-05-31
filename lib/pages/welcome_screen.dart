import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled1/widgets/circular_navigation_bar.dart';
import '../constants.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  late Timer _timer;
  int currentPage = 0;
  final _pageViewController =  PageController();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds:4), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageViewController.animateToPage(
        currentPage,
        duration:const Duration(milliseconds:800),
        curve: Curves.easeIn,
      );

    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: blueColor,
        body: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only( bottomLeft:
                  Radius.circular(30),bottomRight:
                  Radius.circular(30))
              ),
              child: SizedBox(
                height:size.height*0.75,
                child: PageView.builder(
                  controller: _pageViewController,
                  itemCount:splashList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          splashList[index],
                          fit: BoxFit.fitWidth,
                          width:size.width*0.75,
                          alignment: Alignment.bottomCenter,
                        ),
                        Container(
                          padding:const EdgeInsets.symmetric(horizontal:20,vertical: 15),
                          child: Text(
                            textList[index],
                            style: const  TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                ),
                           // textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top:size.height*0.05,left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageViewController,  // PageController
                      count:splashList.length,
                      // forcing the indicator to use a specific direction
                      textDirection: TextDirection.rtl,
                      effect:const WormEffect(
                          dotColor:Colors.white60,
                          activeDotColor:Colors.white
                      ),),
                  ),
                  TextButton(onPressed:()=>Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) =>const CircularNavigationBar())),
                      child: const Text("تخطي",style: TextStyle(color: Colors.white,fontSize:20
                  ),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

