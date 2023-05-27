import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/home.dart';
import 'package:untitled1/widgets/circular_navigation_bar.dart';
import '../constants.dart';
class MedicineDetails extends StatelessWidget {
  const MedicineDetails({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
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
                  IconButton(onPressed: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>CircularNavigationBar())),
                    icon:Icon(Icons.arrow_back,color:Colors.white,size:30,),),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 16,right: 16,bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all( Radius.circular(25),),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height:15,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(child: Image.asset(details[index]["imagesList"])),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("الاسم",style: greyTextStyle,),
                                      Text(details[index]["name"],style: TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:customColor3),),
                                      SizedBox(height: 15,),
                                      Text("الجرعة التالية",style: greyTextStyle,),
                                      Text(details[index]["nextDose"],style: TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:customColor3),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height:35,),
                          Text("الجرعة",style: defaultTextStyle,),
                          SizedBox(height:5,),
                          Text("3 مرات |  am 4 , 12 pm , 8 pm",style: greyTextStyle,),
                          SizedBox(height:25,),
                          Text("مدة الكورس",style: defaultTextStyle,),
                          SizedBox(height:5,),
                          Text("3 أشهر كاملة ",style: greyTextStyle,),
                          SizedBox(height:25,),
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
                                     SizedBox(width: 15,),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("Mar"),
                                         CircleAvatar(
                                           radius: 18,
                                           backgroundColor: customColor5,
                                           foregroundColor: Colors.white,
                                           child: Text("20"),
                                         ),
                                       ],
                                     ),
                                     SizedBox(width: 15,),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("Mar"),
                                         CircleAvatar(
                                           radius: 18,
                                           backgroundColor: customColor5,
                                           foregroundColor: Colors.white,
                                           child: Text("21"),
                                         ),
                                       ],
                                     ),
                                     SizedBox(width: 15,),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("Mar"),
                                         CircleAvatar(
                                           radius: 18,
                                           backgroundColor:customColor2,
                                           foregroundColor: Colors.white,
                                           child: Text("22"),
                                         ),
                                       ],
                                     ),
                                     SizedBox(width: 15,),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("Mar"),
                                         CircleAvatar(
                                           radius: 18,
                                           backgroundColor:customColor5,
                                           foregroundColor: Colors.white,
                                           child: Text("23"),
                                         ),
                                       ],
                                     ),
                                     SizedBox(width: 15,),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("Mar"),
                                         CircleAvatar(
                                           radius: 18,
                                           backgroundColor:customColor2,
                                           foregroundColor: Colors.white,
                                           child: Text("24"),
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
      ),
    );
  }
}
