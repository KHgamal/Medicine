import 'package:flutter/material.dart';

import '../constants.dart';
class MedicineMeal extends StatefulWidget {
  const MedicineMeal({Key? key}) : super(key: key);

  @override
  State<MedicineMeal> createState() => _MedicineMealState();
}

class _MedicineMealState extends State<MedicineMeal> {
bool pressed=false;
int selectedIndex=0;
List meals=[{"image":'assets/before.png',"text":' قبل الأكل'},
  {"image":'assets/with.png',"text":'وسط الأكل',},
  {"image":'assets/after.png',"text":'بعد الأكل'}
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:meals.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal:12),
          child: GestureDetector(
          onTap: ()=>setState(() {
            selectedIndex=index;

            pressed=true;
          }),
          child: Column(
            children: [
              Image.asset(meals[index]["image"],width: 50,height: 50,color:pressed?selectedIndex==index?
              redColor:Colors.black26:Colors.black26),
              Text(meals[index]["text"],style: TextStyle(color:pressed?selectedIndex==index?
              redColor:Colors.black26:Colors.black26,),),
            ],
          ),
      ),
        ),
    );
  }
}
