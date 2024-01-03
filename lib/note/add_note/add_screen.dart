import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_notes/config/firebase_expation/firebase_erorr.dart';
import 'package:my_notes/note/note_screen/note_screen.dart';
import 'package:my_notes/utils/helper/notifcation.dart';
import 'package:my_notes/utils/ui/commn_view.dart';
import 'package:my_notes/utils/ui/loading_screen.dart';
class AddNote extends StatefulWidget {
  final String docId;
  const AddNote({super.key, required this.docId});
  @override
  State<AddNote> createState() => _AddNoteState();
}
class _AddNoteState extends State<AddNote> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController noteController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  XFile? xFile;
  addNote() async {
    CollectionReference note = FirebaseFirestore.instance
        .collection("Categories")
        .doc(widget.docId)
        .collection('note');
    if (formState.currentState!.validate()) {
      try {
        LoadingScreen.shared.startLoading(Get.context);
        String imageUrl = '';
        if (xFile != null) {
          imageUrl = await saveImageStorge(File(xFile!.path));
        }
        DocumentReference response = await note.add({
          'note': noteController.text,
          'image_url': imageUrl,
        });
        LoadingScreen.shared.stopeLoading();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteScreen(
                  category: widget.docId,
                )));
        FlutterNotificationView().showNotification(
          "49 ".tr,
          "50".tr,
        );
      } catch (e) {
        print('18 $e'.tr);
      }
    }
  }

  //storge image in firebase
  Future<String> saveImageStorge(File imgFile) async {
    try {
      LoadingScreen.shared.startLoading(Get.context);
      Reference storgeReference = FirebaseStorage.instance.ref();
      String fileName =
          "fox5${DateTime.now().microsecondsSinceEpoch}${(Random().nextInt(1000))}";
      Reference imageRef = storgeReference.child("image/$fileName.jpg");
      await imageRef.putFile(imgFile);
      LoadingScreen.shared.startLoading(Get.context);
      return imageRef.getDownloadURL();
    } catch (erorr) {
      if (erorr is FirebaseException) {
        CommnViews()
            .showSnackBar('41'.tr, FirebaseErrors.getMessage(erorr.code));
      }
      return "";
    }
  }

  Future<XFile?> _getImage(ImageSource source) async {
    LoadingScreen.shared.startLoading(Get.context);
    ImagePicker picker = ImagePicker();
    LoadingScreen.shared.stopeLoading();
    return picker.pickImage(source: source);
  }

  @override
  void dispose() {
    super.dispose();
    noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: (){
           Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          '51'.tr,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formState,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: CommnViews().createTextFormFiled(
                  controller: noteController,
                  focusNode: nameFocus,
                  label: '52'.tr,
                  validator: (val) {
                    if (val == '') {
                      return '53'.tr;
                    }
                    return null;
                  }),
            ),
            OutlinedButton(
              onPressed: () {
                addNote();
              },
              child: Text(
                '35'.tr,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () async {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.camera_alt_outlined,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,                            ),
                            title: Text(
                              //camera
                              "54".tr,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            onTap: () async {
                              Navigator.of(context).pop();
                              xFile = await _getImage(ImageSource.camera);
                              setState(() {});
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.photo_camera_back,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            title: Text(
                              "55".tr,
                              style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            onTap: () async {
                              Navigator.of(context).pop();
                              xFile = await _getImage(ImageSource.gallery);
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Text(
                '56'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
