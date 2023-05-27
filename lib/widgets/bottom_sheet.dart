import 'package:flutter/material.dart';
import 'package:flutter/services.dart.';
import '../constants.dart';
import '../widgets/drop_down_button.dart';
import '../widgets/medicine_type_listview.dart';
import '../widgets/submit_button.dart';
import '../widgets/text_field.dart';
final formKey = GlobalKey<FormState>();

void modalBottomSheet(context){
  var size=MediaQuery.of(context).size;
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(25),
        topStart: Radius.circular(25),
      ),),
      builder: (builder){
        return  SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.all(18),
            child: Form(
              key:formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     IconButton( onPressed:()=> Navigator.pop(context), icon: Image.asset('assets/close.png'),),
                    const Text("أضف دواء جديد",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: size.height*0.03,),
                  SizedBox(child: CustomTextField(filteringTextInputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 \u0621-\u064A0-9 ]")),
                      keyboardType:TextInputType.text,hintText:"الأسم")),
                  SizedBox(height: size.height*0.03,),
                  Text("الجرعة",style: defaultTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    SizedBox(width:size.width*0.35 ,
                        child: CustomTextField(filteringTextInputFormatter:FilteringTextInputFormatter.allow(RegExp(r'[1-9]')),
                            keyboardType: TextInputType.number,hintText:"عدد المرات")),
                    SizedBox(width:size.width*0.4,child:const DropDown(initialText:"اسبوع", list: ["سنة","شهر","اسبوع","يوم"],)),
                  ],),
                  SizedBox(height: size.height*0.03,),
                   Text("المدة",style: defaultTextStyle,),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    SizedBox(width:size.width*0.35 ,
                        child: CustomTextField( filteringTextInputFormatter:FilteringTextInputFormatter.allow(RegExp(r'[1-9]')),
                            keyboardType: TextInputType.number,hintText:"عدد")),
                    SizedBox(width:size.width*0.4,child:const DropDown(initialText:"اسبوع", list: ["سنة","شهر","اسبوع","يوم"],)),
                  ],),
                   Text("النوع",style:defaultTextStyle,),
                  const SizedBox(
                    height:100,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child:TypesListView()
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Center(child: SubmitButton(onPressed: ()=> formKey.currentState!.validate()?
                  Navigator.pop(context):
                  ScaffoldMessenger.of(context).showSnackBar(
                    const  SnackBar(content: Text("لم يتم حفظ البيانات")),
                  ),)),
                ],
              ),
            ),
          ),
        );
      }
  );
}
