import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:usue_app_rate2/screens/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser (UserModel user) async {
    await _db.collection('User').doc(user.email.toString()).set(user.toJson());
  }

  deleteUser (String str) async {
    await _db.collection('User').doc(str).delete();
  }
}