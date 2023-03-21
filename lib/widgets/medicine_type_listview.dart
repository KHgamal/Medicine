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
        itemCount:imagesList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(onTap: (){setState(() {
      selectedIndex=index;
      categoryTapped=true;
    });},child: MedicineTypesCard(image: imagesList[index], color: categoryTapped? (selectedIndex==index ? customColor2 :Colors.white) :Colors.white,)),
        )
    );
  }
}
