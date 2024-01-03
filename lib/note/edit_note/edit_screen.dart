import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/note/note_screen/note_screen.dart';
import 'package:my_notes/utils/helper/notifcation.dart';
import 'package:my_notes/utils/ui/commn_view.dart';

class EditNote extends StatefulWidget {
  final String notedocId;
  final String categoriesId;
  final String value;
  const EditNote({
    super.key,
    required this.notedocId,
    required this.categoriesId,
    required this.value,
  });
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController noteController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  editNote() async {
    CollectionReference collectionNote = FirebaseFirestore.instance
        .collection("Categories")
        .doc(widget.categoriesId)
        .collection('note');
    if (formState.currentState!.validate()) {
      try {
        await collectionNote.doc(widget.notedocId).update({
          'note': noteController.text,
        });
        //  LoadingScreen.shared.startLoading(Get.context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteScreen(
                  category: widget.categoriesId,
                )));
        //  LoadingScreen.shared.stopeLoading();
        FlutterNotificationView().showNotification(
          '49'.tr,
          "57".tr,
        );
      } catch (e) {
        print('18 $e'.tr);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    noteController.text = widget.value;
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
        // backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          '58'.tr,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formState,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: CommnViews().createTextFormFiled(
                  controller: noteController,
                  focusNode: nameFocus,
                  label: '59'.tr,
                  validator: (val) {
                    if (val == '') {
                      return '53'.tr;
                    }
                    return null;
                  }),
            ),
            OutlinedButton(
              onPressed: () {
                editNote();
              },
              child: Text(
                '28'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
