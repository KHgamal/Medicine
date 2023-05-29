import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import '../widgets/add_medicine_container.dart';
import '../widgets/drop_down_button.dart';
import '../widgets/medicine_meal.dart';
import '../widgets/medicine_type_listview.dart';
import '../widgets/text_field.dart';
class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  TextEditingController name=TextEditingController();
  TextEditingController note=TextEditingController();
  TextEditingController startDate=TextEditingController();
  TextEditingController endDate=TextEditingController();
  TextEditingController num=TextEditingController();
  TextEditingController time=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bottomNavBarHeight = size.height * 0.1;
    return Padding(
      padding:  EdgeInsets.only(bottom: bottomNavBarHeight),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              children: [
                AddMedicineContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("إضافة دواء",style:TextStyle(color:redColor ,fontSize: 30 ,fontWeight:FontWeight.bold ),)),
                      Text("اسم الدواء",style: Theme.of(context).textTheme.titleLarge),
                      CustomTextField(filteringTextInputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 \u0621-\u064A0-9 ]")),
                          keyboardType:TextInputType.text,hintText:"اكتب اسم الدواء", controller: name, readOnly: false,),
                      Text("نوع الدواء",style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(
                        height:100,
                        child: TypesListView(),
                      ),
                      Text("ملاحظات",style: Theme.of(context).textTheme.titleLarge),
                      CustomTextField(filteringTextInputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 \u0621-\u064A0-9 ]")),
                          keyboardType:TextInputType.text,hintText:"هل لديك أية ملاحظات بشأن الدواء ؟", controller: note, readOnly: false,),
                    ],
                  ),),
                AddMedicineContainer(
                  child:Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("العلاج هيبدأ ؟",style: Theme.of(context).textTheme.titleLarge),
                       SizedBox(
                         width:200,
                         child: CustomTextField(filteringTextInputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 \u0621-\u064A0-9 ]")),
                             keyboardType:TextInputType.text,hintText:"ادخل التاريخ",
                      prefixIcon: const Icon(Icons.calendar_today), controller: startDate, readOnly: false,
                          ),
                       ),
                       Text("العلاج هينتهي ؟",style: Theme.of(context).textTheme.titleLarge),
                       SizedBox(
                         width:200,
                         child: CustomTextField(filteringTextInputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 \u0621-\u064A0-9 ]")),
                           keyboardType:TextInputType.text,hintText:"ادخل التاريخ",
                           prefixIcon: const Icon(Icons.calendar_today), controller: endDate, readOnly: false,
                         ),
                       ),

                     ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset("assets/no.jpg",width:90,height:200,fit: BoxFit.fitHeight,),
                    ),
                  ],
                  ),),
                AddMedicineContainer(
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Text("الجرعة : ",style: defaultTextStyle,),
                          SizedBox(
                            width:200,
                            child: CustomTextField(filteringTextInputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 \u0621-\u064A0-9 ]")),
                              keyboardType:TextInputType.text,hintText:"كمية الدواء مثال عدد الأقراص", controller: time, readOnly: false,
                            ),
                          ),
                        ],
                      ),const SizedBox(height: 15,),
                      Row(
                        children: [
                        Text("عدد المرات : ",style: defaultTextStyle,),
                          SizedBox(
                              width:80 ,
                              child: CustomTextField(filteringTextInputFormatter:FilteringTextInputFormatter.allow(RegExp(r'[1-9]')),
                                  keyboardType: TextInputType.number,hintText:"العدد", controller: num, readOnly: false,)),
                        const  SizedBox(
                              width:120,child: DropDown(initialText:"يوم", list: ["سنة","شهر","اسبوع","يوم"],)),
                        ],),const SizedBox(height: 15,),
                      Row(
                        children: [
                          Text("التوقيت : ",style: defaultTextStyle,),
                          SizedBox(
                            width: 200,
                            child: CustomTextField(filteringTextInputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 \u0621-\u064A0-9 ]")),
                              keyboardType:TextInputType.text,hintText:"ادخل الساعة",
                              prefixIcon:const Icon(Icons.watch_later_outlined), controller: time, readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),),
                AddMedicineContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text("الجرعة هتكون :",style: Theme.of(context).textTheme.titleLarge),
                        ),
                        const SizedBox(
                          height:80,
                          child: MedicineMeal(),
                        ),
                      ],
                    )),

              ],
          ),
        ),
      ),
    );
  }
}
