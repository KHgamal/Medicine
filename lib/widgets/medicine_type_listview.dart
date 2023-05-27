import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/card_medicine_type.dart';
class TypesListView extends StatefulWidget {
  const TypesListView({Key? key}) : super(key: key);

  @override
  State<TypesListView> createState() => _TypesListViewState();
}

class _TypesListViewState extends State<TypesListView> {
  bool categoryTapped =false;
  int selectedIndex=0;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:details.length+1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: index==0?
          Container(
            width:90,
            decoration: const BoxDecoration(
              color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: IconButton(onPressed: (){} , icon: Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.camera_alt,color: Colors.black26,),
                Text("اضف صورة",style: TextStyle(color: Colors.black26),)
              ],
            ) ,),
          )
         :GestureDetector(onTap: (){setState(() {
      selectedIndex=index;
      categoryTapped=true;
    });},child: MedicineTypesCard(image:details[index-1]['imagesList'], color: categoryTapped?
          (selectedIndex==index ?redColor :Colors.white) :Colors.white,
          text:details[index-1]['name'] ,)),
        )
    );
  }
}
