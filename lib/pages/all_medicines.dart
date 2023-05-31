import 'package:flutter/material.dart';
import 'package:untitled1/constants.dart';

import '../widgets/medicine_list_container.dart';

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
    super.dispose();
    // _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.sort,
              color: blueColor,
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            title: SizedBox(
              height: 38,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: colorsList[0],
                  contentPadding: const EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: redColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(80),
                      borderSide: BorderSide.none),
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  hintText: "Search Medicine",
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white, //Color(0xffcdecf6),
          body: ListView.builder(
            //physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(12),
            //shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: MedicineListContainer(
                  showColor: true,
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
                  secondDose: details[index]['second dose'], //colorsList[index % 4],
                  doseContainerColor: Colors.white,
                  doseFontColor: colorsList[index % 4],
                ),
              );
            },
            itemCount: details.length,
          ),
          /*Stack(
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
                            padding:const EdgeInsets.all(8),
                            decoration:const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            margin:const EdgeInsets.only(top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:50),
                                    child: Text(
                                      details[index]['name'],
                                      style: const  TextStyle(
                                        fontSize:30,
                                      ),
                                      // textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Text("ملاحظات",style: Theme.of(context).textTheme.titleLarge,),
                                const Text("عليك بإبلاغ الطبيب أو الصيدلاني عن تناولك أدويه أخرى أو مكملات غذائية أو أدويه طبيعيه."),
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment:Alignment.topCenter,
                            child: CircleAvatar(
                              radius:50,
                              backgroundColor: Colors.white,
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
          ),*/
        ),
      ),
    );
  }
}
