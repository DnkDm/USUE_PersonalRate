import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final int rait;
  final String img;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.rait,
    required this.img,

  });

  toJson() {
    return {
      'Name': name,
      'Email': email,
      'Password': password,
      'Rait': rait,
      'imageLisk' : img,

    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        name: data['Email'],
        email: data['Name'],
        password: data['Password'],
        rait: data['Rait'],
        img: data['imageLisk'],
    );
  }
}
