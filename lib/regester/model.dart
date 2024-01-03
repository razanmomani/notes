import 'dart:io';

class UserModel {
  String email;
  String? password;
  String fullName;
  String? uid;
  File? file;
  UserModel(
      {
        required this.email,
        this.password,
        required this.fullName,
        this.uid,
        this.file});


//firebase regester firestore
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      'email': email,
      'uid': uid,
      'fullName': fullName,
    };
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      fullName: map['fullName'],
    );
  }
}
