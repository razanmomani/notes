import 'dart:io';
import 'package:image_picker/image_picker.dart';
// Abstract class that defines the image picking methods.
abstract class ImagePickerBase {
  Future<File?> pickImageFromCamera();
  Future<File?> pickImageFromGallery();
}
// Concrete implementation of the image picker methods.
class YourImagePicker implements ImagePickerBase {
  @override
  Future<File?> pickImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
  @override
  Future<File?> pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}