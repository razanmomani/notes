/*import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/config/firebase_expation/firebase_erorr.dart';
import 'package:my_notes/home_page/edit_screen.dart';
import 'package:my_notes/note/note_screen/note_screen.dart';
import 'package:my_notes/utils/ui/commn_view.dart';
import 'package:my_notes/utils/ui/loading_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<QueryDocumentSnapshot> data = [];
  //جلب الداتا من فاير بيس
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    // setState(() {});
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
        backgroundColor: Colors.orange,
        onPressed: () {
          LoadingScreen.shared.startLoading(Get.context);
          Navigator.of(context).pushNamed("addCatogries");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
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
                LoadingScreen.shared.stopeLoading();

              } catch (error) {
                if (error is FirebaseException) {
                  CommnViews().showSnackBar(
                      'Failed', FirebaseErrors.getMessage(error.code));
                  LoadingScreen.shared.stopeLoading();
                } else {
                  CommnViews().showSnackBar('Failed', error.toString());
                }
              }
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 200,
        ),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteScreen(
                categorie: data[i].id,
              )));
            },
            onLongPress: () {
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.rightSlide,
                  title: 'Error',
                  desc: 'You can perform the deletion and modification process',
                  btnCancelText: 'delete',
                  btnOkText: 'update',
                  btnCancelOnPress: () async {
                    LoadingScreen.shared.startLoading(Get.context);

                    //delete data
                    await FirebaseFirestore.instance
                        .collection('Categories')
                        .doc(data[i].id)
                        .delete();
                    LoadingScreen.shared.stopeLoading();
                    Navigator.of(context).pushReplacementNamed('HomePage');

                  },
                  btnOkOnPress: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditCategories(
                              oldName: data[i]['name'],
                              docId: data[i].id,
                        )));
                    LoadingScreen.shared.stopeLoading();

                  }).show();
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/folder.png',
                      height: 120,
                    ),
                    Text("${data[i]['name']}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}*/
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/note/note_screen/note_screen.dart';
import 'package:my_notes/utils/ui/loading_screen.dart';
import '../controller/home_controller.dart';
import '../drawer/drawer_widgeat.dart';
import 'edit_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '17'.tr,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  LoadingScreen.shared.startLoading(Get.context);
                  Get.offAllNamed('LoginScreen');
                } catch (erorr) {
                  print("22: $erorr".tr);
                  Get.snackbar('18'.tr, '23'.tr);
                } finally {
                  LoadingScreen.shared.stopeLoading();
                }
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        drawer: DrawerScreen(),
        body: FutureBuilder<void>(
          future: controller.getData(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Obx(
                    () => GridView.builder(
                      itemCount: controller.categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                      ),
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NoteScreen(
                                      category: controller.categories[i].id,
                                    )));
                            Get.to(() => NoteScreen(
                                  category: controller.categories[i].id.tr,
                                ));
                          },
                          onLongPress: () {
                            AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                title: '18'.tr,
                                desc: '19'.tr,
                                btnCancelText: '20'.tr,
                                btnOkText: '21'.tr,
                                btnCancelOnPress: () async {
                                  try {
                                    LoadingScreen.shared
                                        .startLoading(Get.context);
                                    await controller.deleteCategory(
                                        controller.categories[i].id.tr);
                                  } catch (error) {
                                    print("24 $error".tr);
                                    Get.snackbar('18'.tr, '25'.tr);
                                  } finally {
                                    LoadingScreen.shared.stopeLoading();
                                  }
                                },
                                btnOkOnPress: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditCategories(
                                            oldName:
                                                controller.categories[i].name,
                                            docId: controller.categories[i].id,
                                          )));

                                  Get.to(EditCategories(
                                    oldName: controller.categories[i].name.tr,
                                    docId: controller.categories[i].id.tr,
                                  ));
                                  LoadingScreen.shared.stopeLoading();
                                }).show();
                          },
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/folder.png',
                                    height: 120,
                                  ),
                                  Text(
                                    controller.categories[i].name.tr,
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
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            LoadingScreen.shared.startLoading(Get.context);
            Navigator.of(context).pushNamed("addCatogries");
            //  Get.offAll(()=>AddCategories());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
