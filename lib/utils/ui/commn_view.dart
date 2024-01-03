import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_notes/utils/ui/theme/custom_theme/text_form_filed_theme.dart';
class CommnViews {
  static final CommnViews _sheard = CommnViews.privet();
  factory CommnViews()=> _sheard;
  CommnViews.privet();
//appBar
  AppBar getAppBar({required String title, required IconButton leading, }){//String ?leading {
    return AppBar(
      backgroundColor: Colors.orange,
     /* leading: IconButton(
        onPressed: (){},
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),*/
      shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      title: Text(title,
        style: GoogleFonts.alkalami(
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    );
  }

  //Button
  Widget createButton({
    required String title,
    required VoidCallback onPressed,
    Color ?backgroundColor,
    String ?image
  }) {
    return ElevatedButton(
   /*   style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 22)),
      ),*/
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 10,),
          if (image != null)
            Image.asset(image,
              height: 18,
              // You can adjust the height as per your requirement
            ),


        ],
      ),


    );
  }
//Text form field
  Widget createTextFormFiled(
      {required TextEditingController controller, required FocusNode focusNode,
        required String label,
        TextInputType keyboardType = TextInputType.text,
        TextInputAction InputActione = TextInputAction.done,
        bool isObscuer = false,
        ValueChanged<String>?onSubmitted,
      //  String? prefixText,
        Widget? prefixIcon,
        Widget ?suffixIcon,
        String ?errorText,
        bool isDarkTheme = false,
        final String ?Function(String?) ?validator,
      }) {
    Color labelColor = isDarkTheme ? Colors.white : Colors.orange;
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscuer,
      keyboardType: keyboardType,
      textInputAction: InputActione,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: labelColor,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),





/*
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        prefixText: preffixText,
        suffixIcon: suffixIcon,
        errorText: errorText,
        border: _getBorder(),
        enabledBorder: _getBorder(),
        disabledBorder: _getBorder(),
        focusedBorder: _getBorder(),
      ),
*/
    );
  }
  // widget border in text form filed
/*
  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    );
  }
*/
//snackbar
  void showSnackBar(String title, String msg) {
    Get.snackbar(
      title, msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      duration: const Duration(seconds: 5),
    );
  }

}