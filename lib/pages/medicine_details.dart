import 'package:flutter/material.dart';
import 'package:untitled1/widgets/dose_container.dart';
import '../constants.dart';

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  /*pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const CircularNavigationBar())),*/
                  icon: Icon(
                    Icons.arrow_back,
                    color: redColor,
                    size: 30,
                  ),
                ),
                Stack(
                  children: [
                    Image.asset(
                      "assets/bg.jpg",
                      height: size.height,
                      fit: BoxFit.fitHeight,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              margin: const EdgeInsets.only(top: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Text(
                                        details[index]['name'],
                                        style: const TextStyle(
                                          fontSize: 30,
                                        ),
                                        // textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "ملاحظات",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const Text(
                                      "عليك بإبلاغ الطبيب أو الصيدلاني عن تناولك أدويه أخرى أو مكملات غذائية أو أدويه طبيعيه."),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Image.asset(
                                  details[index]['imagesList'],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                /*Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(details[index]["imagesList"]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          details[index]["name"],
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: blueColor),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'larem ipsum is simply dummy text of the printing avd typeseetting industry. larem ipsum has been.',
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DoseContainer(
                              dose: details[index]['first dose'],
                              color: blueColor,
                              fontSize: 20, fontColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            DoseContainer(
                              dose: details[index]['second dose'],
                              color: redColor,
                              fontSize: 20, fontColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DetailsContainer(
                              color: redColor,
                              icon: Icons.list_alt,
                              subTitle: 'تم اخذه 4/31',
                              title: 'This Month',
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            DetailsContainer(
                              title: 'Amount',
                              subTitle: details[index]['concentration'],
                              icon: Icons.calendar_month_outlined,
                              color: blueColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        /* Text("الجرعة",style: defaultTextStyle,),
                        const SizedBox(height:5,),
                        Text("3 مرات |  am 4 , 12 pm , 8 pm",style: greyTextStyle,),
                        const SizedBox(height:25,),
                        Text("مدة الكورس",style: defaultTextStyle,),
                        const SizedBox(height:5,),
                        Text("3 أشهر كاملة ",style: greyTextStyle,),
                        const SizedBox(height:25,),
                        Text("جدولك",style: defaultTextStyle,),*/
                        SizedBox(
                          height: 80,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 7,
                            child: SizedBox(
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Mar"),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: customColor5,
                                        foregroundColor: Colors.white,
                                        child: const Text("20"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Mar"),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: customColor5,
                                        foregroundColor: Colors.white,
                                        child: const Text("21"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Mar"),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: customColor2,
                                        foregroundColor: Colors.white,
                                        child: const Text("22"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Mar"),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: customColor5,
                                        foregroundColor: Colors.white,
                                        child: const Text("23"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Mar"),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: customColor2,
                                        foregroundColor: Colors.white,
                                        child: const Text("24"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              //color:blueColor,
              blurRadius: 3,
              offset: Offset(2, 4), // Shadow position
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 26,
              //Icons.list_alt,
              color: color,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  title,
                  //'This Month',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  subTitle,
                  //'تم اخذه 4/31',
                  style: TextStyle(
                    color: color,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/* Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("الاسم",style: greyTextStyle,),
                                    Text(details[index]["name"],style: TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:customColor3),),
                                    const SizedBox(height: 15,),
                                    Text("الجرعة التالية",style: greyTextStyle,),
                                    Text(details[index]["nextDose"],style: TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:customColor3),),
                                  ],
                                ),
                              ),*/