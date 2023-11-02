import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/singup_screen.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;




class StoreData {

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName).child((FirebaseAuth.instance.currentUser!.email).toString());
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String download = await snapshot.ref.getDownloadURL();

    return download;
  }

  Future<String> saveData(
      {required String name, required Uint8List file,})
  async {
    String resp = ' Some Error Occurred';
    try{

      if(name.isNotEmpty){
        //name = (FirebaseAuth.instance.currentUser?.email).toString();

      String imageUrl = await uploadImageToStorage('profileImage', file);
      await _firestore.collection('User').doc((FirebaseAuth.instance.currentUser!.email).toString()).update( {
        'Email': FirebaseAuth.instance.currentUser!.email,
        'Name': name,

        'imageLisk' : imageUrl,
      });
      resp = 'success';
    }}
        catch(err){
      resp = err.toString();
      
        }
    return resp;
  }

}

class StoreDataNoImg {


  Future<String> saveData(
      {required String name})
  async {
    String resp = ' Some Error Occurred';
    try{

      if(name.isNotEmpty){
        //name = (FirebaseAuth.instance.currentUser?.email).toString();

        await _firestore.collection('User').doc((FirebaseAuth.instance.currentUser!.email).toString()).update( {
          'Email': FirebaseAuth.instance.currentUser!.email,
          'Name': name,

        });
        resp = 'success';
      }}
    catch(err){
      resp = err.toString();

    }
    return resp;
  }

}