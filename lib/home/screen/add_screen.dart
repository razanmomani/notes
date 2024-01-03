/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/utils/ui/commn_view.dart';
class AddCategories extends StatefulWidget {
  const AddCategories({super.key});
  @override
  State<AddCategories> createState() => _AddCategoriesState();
}
class _AddCategoriesState extends State<AddCategories> {
  GlobalKey <FormState> formState=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  FocusNode nameFocus = FocusNode();
  CollectionReference  categories =FirebaseFirestore.instance.collection("Categories");
  addUser()async{
    if(formState.currentState!.validate()){
      try{
        DocumentReference response=await categories.add({
          'name':nameController.text,
          'id':FirebaseAuth.instance.currentUser!.uid,

        });
        Navigator.of(context).pushNamedAndRemoveUntil('HomePage',(route)=>false);
      }catch(e){
        print('erorr $e');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading:const Icon(Icons.arrow_back,
          color: Colors.white,
        ),

        title: const Text('Add Categories',
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
              addUser();
            },
                child: const Text('Add',
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
import 'package:my_notes/utils/ui/commn_view.dart';
import '../controller/add_controller.dart';
class AddCategories extends StatelessWidget {
  AddCategories({super.key});
  final AddController controller = Get.put(AddController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: (){
            Get.back();
          },
        ),
        title:  Text(
          '32'.tr,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: CommnViews().createTextFormFiled(
                controller: controller.nameController,
                focusNode: controller.nameFocus,
                label: '33'.tr,
                validator: (val) {
                  if (val == '') {
                    return '34'.tr;
                  }
                }),
          ),
          OutlinedButton(
            onPressed: () {
              controller.addUser();
            },
            child:  Text(
              '35'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
