import 'package:flutter/material.dart';
Color blueColor=const Color(0xff1cb7d1);
Color redColor=const Color(0xfffb8574);
Color customColor=const Color(0xff31275c);
Color customColor1=const Color(0xff443472);
Color customColor2=const Color(0xff70609f);
Color customColor3=const Color(0xff938acb);
//00d19d
Color customColor4=const Color(0xffa8a8e6);
Color customColor5=const Color(0xffdedffd);
List<Map> details=[{"name":'seringa','nextDose':'10:00',"imagesList":'assets/p1.png'}
,{"name":'pills','nextDose':'12:00',"imagesList":'assets/p2.png'},
{"name":'Marivan','nextDose':'04:00',"imagesList":'assets/p3.png'},
{"name":'Asthma device','nextDose':'06:00',"imagesList":'assets/p4.png'},
{"name":'collyrium','nextDose':'08:00',"imagesList":'assets/p5.png'}
 // ,{"name":'sachet','nextDose':'12:00',"imagesList":'assets/p6.png'},
];

List<String> textList=['تطبيق دوائي يسمح لك بعمل جدول لمواعيد دوائك و يرسل لك اشعارات في هذه المواعيد كما يرسل '
    'اليك اشعار عند اقتراب انتهاء الكمية الموجودة في بيتك من الادوية','يمكنك التعديل على جدولك كما يتتبع التطبيق تاريخ الأدوية للمستخدم ، حتى يتمكنوا من '
    'معرفة متى أخذوا أدويتهم ومتى فاتتهم جرعة.','يسمح التطبيق للمستخدم بإدخال وتخزين جميع التفاصيل الضرورية عن أدويته ، مثل الاسم والجرعة والتكرار والمدة.'];
List<String> splashList=['assets/splash 1.jpg','assets/splash 2.png','assets/splash 3.jpg'];
var logo=Image.asset('assets/logo.png');
TextStyle defaultTextStyle=const TextStyle(fontSize: 20,fontWeight:FontWeight.bold);
TextStyle greyTextStyle=const TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.bold);

//problem
//1.on date selection today day show white circle
//2.when pressing MedicineDetails Directionality eng