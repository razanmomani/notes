/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/utils/ui/commn_view.dart';
class EditCategories extends StatefulWidget {
  final String docId;
  final String oldName;

  const EditCategories({super.key, required this.docId, required this.oldName});
  @override
  State<EditCategories> createState() => _EditCategoriesState();
}
class _EditCategoriesState extends State<EditCategories> {
  GlobalKey <FormState> formState=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  FocusNode nameFocus = FocusNode();
  CollectionReference  categories =FirebaseFirestore.instance.collection("Categories");
  editCategories()async{
    if(formState.currentState!.validate()){
      try{
      await categories.doc(widget.docId).update({
        'name':nameController.text,
        });
        Navigator.of(context).pushNamedAndRemoveUntil('HomePage',(route)=>false);
      }catch(e){
        print('erorr $e');
      }
    }
  }
  @override
  void initState() {
    super.initState();
    nameController.text=widget.oldName;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading:Icon(Icons.arrow_back,
          color: Colors.white,
        ),

        title: Text('Add Categories',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formState,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: CommnViews().createTextFormFiled(
                  controller: nameController,
                  focusNode:nameFocus ,
                  label: 'Name',
                  validator: (val){
                    if(val== ''){
                      return 'can t to be Empty ';
                    }
                  }
              ),
            ),
            OutlinedButton(onPressed: (){
              editCategories();
            },
              child: Text('Save',
                style: TextStyle(color: Colors.orange),
              ),


            ),




          ],
        ),


      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/tranislation/controller.dart';

import '../controller/edit_controller.dart';

class EditCategories extends StatelessWidget {
  final String docId;
  final String oldName;
  EditCategories({Key? key, required this.docId, required this.oldName})
      : super(key: key);
  final EditController controller = Get.put(EditController());
  MyController myController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          '26'.tr, // Corrected title
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formState,
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                focusNode: controller.nameFocus,
                decoration: InputDecoration(
                  labelText: '27'.tr,
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return '31'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  controller.editCategories(docId);
                },
                child: Text(
                  '28'.tr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
