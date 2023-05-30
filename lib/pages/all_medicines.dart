import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled1/constants.dart';

class MedicinesPage extends StatefulWidget {
  const MedicinesPage({super.key});

  @override
  State<MedicinesPage> createState() => _MedicinesPageState();
}

class _MedicinesPageState extends State<MedicinesPage> {
  // late Timer _timer;
  // int currentPage = 0;
  // final _pageViewController =  PageController();

  @override
  void initState() {
    super.initState();
    // _timer = Timer.periodic(const Duration(seconds:4), (Timer timer) {
    //   if (currentPage < details.length-1) {
    //     currentPage++;
    //   } else {
    //     currentPage = 0;
    //   }
    //
    //   _pageViewController.animateToPage(
    //     currentPage,
    //     duration:const Duration(milliseconds:800),
    //     curve: Curves.easeIn,
    //   );
    //
    // });
  }

  @override
  void dispose() {
    // super.dispose();
    // _timer.cancel();

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child:Scaffold(
          body: Stack(
            children: [
              Image.asset("assets/bg.jpg",height: size.height,fit: BoxFit.fitHeight,),
              PageView.builder(
                itemCount:details.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: 300,
                            decoration:const BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            margin:const EdgeInsets.only(top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:50),
                                  child: Text(
                                    details[index]['name'],
                                    style: const  TextStyle(
                                      fontSize:30,
                                    ),
                                    // textAlign: TextAlign.center,
                                  ),
                                ),
                                Text("ملاحظات"),
                                Text("hghghgureguygughvbhguyghgvhgguiguuigiug"),
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment:Alignment.topCenter,
                            child: CircleAvatar(
                              radius:50,
                              backgroundColor: Colors.white54,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Image.asset(
                                  details[index]['imagesList'],
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
 Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child:  Scaffold(
          backgroundColor: Color(0xffcdecf6),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 300,
                    decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    margin:const EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed:(){
                                if(index>0) index--;
                                setState(() {
                                });
                              }, icon: const  Icon( Icons.arrow_back_ios_outlined ,
                              color:Colors.black54 ,),
                              ),
                              Text(
                                details[index]['name'],
                                style: const  TextStyle(
                                  fontSize:30,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                              IconButton(onPressed:(){
                                if(index<details.length-1) index++;
                                setState(() {
                                });
                              }, icon: const
                              Icon( Icons.arrow_forward_ios_outlined,color:Colors.black54)),
                            ],
                          ),
                        ),
                        Text("ملاحظات"),
                        Text("hghghgureguygughvbhguyghgvhgguiguuigiug"),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment:Alignment.topCenter,
                    child: CircleAvatar(
                      radius:50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius:40,
                        backgroundColor:const Color(0xffcdecf6),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset(
                            details[index]['imagesList'],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
 */