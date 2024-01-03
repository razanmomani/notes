import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_notes/config/firebase_expation/firebase_erorr.dart';
import 'package:my_notes/note/add_note/add_screen.dart';
import 'package:my_notes/note/edit_note/edit_screen.dart';
import 'package:my_notes/utils/ui/commn_view.dart';
import 'package:my_notes/utils/ui/loading_screen.dart';
class NoteScreen extends StatefulWidget {
  final String category;
  const NoteScreen({super.key, required this.category});
  @override
  State<NoteScreen> createState() => _NoteScreenState();
}
class _NoteScreenState extends State<NoteScreen> {
  List<QueryDocumentSnapshot> data = [];
  late String url;
  //جلب الداتا من فاير بيس
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .doc(widget.category)
        .collection('note')
        .get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      //  backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddNote(
                    docId: widget.category,
                  )));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
      //  backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title:  Text(
          '47'.tr,
        //  style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              try {
                LoadingScreen.shared.startLoading(Get.context);
                await FirebaseAuth.instance.signOut();
                //Get.to(LoginScreen());
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('LoginScreen', (route) => false);
              } catch (error) {
                if (error is FirebaseException) {
                  CommnViews().showSnackBar(
                      '41'.tr, FirebaseErrors.getMessage(error.code));
                  LoadingScreen.shared.stopeLoading();
                } else {
                  CommnViews().showSnackBar('41'.tr, error.toString());
                }
              }
            },
            icon:  Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: data.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 180,
        ),
        itemBuilder: (context, i) {
          return InkWell(
            onLongPress: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.rightSlide,
                title: '18'.tr,
                desc: '48'.tr,
                btnOkText: '60'.tr,
                btnCancelText: '61'.tr,
                btnOkOnPress: () async {
                  //delete data
                  await FirebaseFirestore.instance
                      .collection('Categories')
                      .doc(widget.category)
                      .collection('note')
                      .doc(data[i].id.tr)
                      .delete();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NoteScreen(
                            category: widget.category,
                          )));
                },
                btnCancelOnPress: () {
                },
              ).show();
            },
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditNote(
                        categoriesId: widget.category,
                        value: data[i]['note'.tr],
                        notedocId: data[i].id,
                      )));
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data[i]['image_url'] != null &&
                        data[i]['image_url'].isNotEmpty)
                      Image.network(
                        data[i]['image_url'],
                        height: 45, // Set your desired height
                        width: 45, // Set your desired width
                        fit: BoxFit.cover, // Set the image fit
                      ),
                     SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${data[i]['note'.tr]}",
                      style: GoogleFonts.alike(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
