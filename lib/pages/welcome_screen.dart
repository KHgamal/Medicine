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

    return SafeArea(
      child: Scaffold(
        backgroundColor: blueColor,
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.only( bottomLeft:
                      Radius.circular(30),bottomRight:
                      Radius.circular(30))
                  ),
                  child: SizedBox(
                    height:450,
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
                              width: 220.0,
                              alignment: Alignment.bottomCenter,
                            ),
                            Container(
                              padding:const EdgeInsets.symmetric(horizontal:20,vertical: 15),
                              child: Text(
                                textList[index],
                                style: const TextStyle(
                                    color: Colors.grey,
                                    letterSpacing: 1.2,
                                    fontSize: 16.0,
                                    height: 1.3),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Container(
                 margin:const EdgeInsets.only(top:420),
                 child: Center(child:
                 CircleAvatar(
                   radius:34,
                   backgroundColor:redColor,
                   child: IconButton(onPressed: (){
                     setState(() {
                       currentPage++;
                     });
                   }, icon: const Icon
                     (Icons.arrow_forward,color: Colors.white,)),))),
                // )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                TextButton(onPressed:() {
                  setState(() {
                    currentPage--;print(currentPage);
                  }
                  );
                }, child: const Text("السابق",style: TextStyle(
                  color: Colors.white,fontSize:20
                ),)),
                SmoothPageIndicator(
                  controller: _pageViewController,  // PageController
                  count:splashList.length,
                  // forcing the indicator to use a specific direction
                  textDirection: TextDirection.rtl,
                  effect:const WormEffect(
                      dotColor:Colors.white60,
                      activeDotColor:Colors.white
                  ),),
                TextButton(onPressed:()=>Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>const CircularNavigationBar())),
                    child: const Text("تخطي",style: TextStyle(color: Colors.white,fontSize:20
                ),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

