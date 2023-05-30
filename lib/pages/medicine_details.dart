import 'package:flutter/material.dart';
import 'package:untitled1/widgets/circular_navigation_bar.dart';
import '../constants.dart';
class MedicineDetails extends StatelessWidget {
  const MedicineDetails({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [customColor1,customColor2,customColor3, customColor5],
            ),),
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const CircularNavigationBar())),
                  icon:const Icon(Icons.arrow_back,color:Colors.white,size:30,),),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 16,right: 16,bottom: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all( Radius.circular(25),),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height:15,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(child: Image.asset(details[index]["imagesList"])),
                              const SizedBox(width: 15,),
                              Expanded(
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
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(height:35,),
                        Text("الجرعة",style: defaultTextStyle,),
                        const SizedBox(height:5,),
                        Text("3 مرات |  am 4 , 12 pm , 8 pm",style: greyTextStyle,),
                        const SizedBox(height:25,),
                        Text("مدة الكورس",style: defaultTextStyle,),
                        const SizedBox(height:5,),
                        Text("3 أشهر كاملة ",style: greyTextStyle,),
                        const SizedBox(height:25,),
                        Text("جدولك",style: defaultTextStyle,),
                        SizedBox(
                          height:80,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),elevation:7,
                             child: SizedBox(
                               child: Row(
                                 children: [
                                   const SizedBox(width: 15,),
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
                                   const SizedBox(width: 15,),
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
                                   const SizedBox(width: 15,),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       const Text("Mar"),
                                       CircleAvatar(
                                         radius: 18,
                                         backgroundColor:customColor2,
                                         foregroundColor: Colors.white,
                                         child: const Text("22"),
                                       ),
                                     ],
                                   ),
                                   const SizedBox(width: 15,),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       const Text("Mar"),
                                       CircleAvatar(
                                         radius: 18,
                                         backgroundColor:customColor5,
                                         foregroundColor: Colors.white,
                                         child: const Text("23"),
                                       ),
                                     ],
                                   ),
                                   const SizedBox(width: 15,),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       const Text("Mar"),
                                       CircleAvatar(
                                         radius: 18,
                                         backgroundColor:customColor2,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
