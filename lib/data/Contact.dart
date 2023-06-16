import 'dart:io';
import 'package:meta/meta.dart';

class Contact {
  // table id like pk
//  int id;
  String name;
  String email;
  String phoneNumber;
  bool isFavourite;
  //File imageFile;

  // requried
  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.isFavourite = false,
    //required this.imageFile,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'isFavourite': isFavourite,
    };
  }

  static Contact fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      isFavourite: map['isFavourite'],
    );
  }
}
