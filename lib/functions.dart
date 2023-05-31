/*TimePicker on TextField*/
// onTap: () async {
// TimeOfDay pickedTime =  await showTimePicker(
// initialTime: TimeOfDay.now(),
// context: context,
// );
//
// if(pickedTime != null ){
// print(pickedTime.format(context));   //output 10:51 PM
// DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
// //converting to DateTime so that we can further format on different pattern.
// print(parsedTime); //output 1970-01-01 22:53:00.000
// String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
// print(formattedTime); //output 14:59:00
// //DateFormat() is from intl package, you can format the time on any pattern you need.
//
// setState(() {
// timeinput.text = formattedTime; //set the value of text field.
// });
// }else{
// print("Time is not selected");
// }
// },

/* time spinner flutter*/
//https://flutterappdev.com/2019/08/30/a-flutter-widget-to-set-time-with-spinner-instead-of-material-time-picker/

/*Show Date Picker on TextField*/
//https://www.fluttercampus.com/guide/39/how-to-show-date-picker-on-textfield-tap-and-get-formatted-date/

/*pickImage*/
/*
File? image;


  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

    image==null? CircleAvatar(
                     backgroundColor: Colors.black26,
                       radius:30,
                       child:IconButton(onPressed: ()=>pickImage(), icon: const
                       Icon(Icons.person_add_alt_1_sharp,color: Colors.white,size:35,))
                          ,
                     ):CircleAvatar(
                         radius:30,
                         backgroundImage: FileImage(image!),
                       ),),
 */

//SubmitButton
/*
Center(child: SubmitButton(onPressed: ()=> formKey.currentState!.validate()?
                  Navigator.pop(context):
                  ScaffoldMessenger.of(context).showSnackBar(
                    const  SnackBar(content: Text("لم يتم حفظ البيانات")),
                  ),)),
 */