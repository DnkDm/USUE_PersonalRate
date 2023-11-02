import 'dart:core';
import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:usue_app_rate2/screens/login_screen.dart';
import 'package:usue_app_rate2/screens/account_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usue_app_rate2/screens/singup_screen.dart';
import 'package:usue_app_rate2/screens/user_model.dart';
import 'package:usue_app_rate2/utils/utils.dart';
import 'package:usue_app_rate2/resources/add_data.dart';

@RoutePage()
class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  Uint8List? _image;
  final TextEditingController nameController = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  final snapshot = FirebaseFirestore.instance
      .collection('User')
      .where('Email', isEqualTo: globalEmail)
      .get();

  String oldName = 'o';




  void saveProfile() async {

    String name = nameController.text;

    if (name.isEmpty){
      name = oldName;
    }
    if (_image == null){
      String resp = await StoreDataNoImg().saveData(name: name);
    } else {
      String resp = await StoreData().saveData(name: name, file: _image!);

    }

    //if (name.isEmpty)
      //name = oldName;
      //name = AutofillHints.email.toString();

   //String resp = await StoreData().saveData(name: name, file: _image!);
  }

  final _db = FirebaseFirestore.instance;

  // Future<UserModel> getUserDetails(String email) async {
  //   final snapshot = await _db
  //       .collection('User')
  //       .where('Email', isEqualTo: globalEmail)
  //       .get();
  //   final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  //   return userData;
  // }
  //
  // Future<List<UserModel>> allUsers() async {
  //   final snapshot = await _db.collection('User').get();
  //   final userData =
  //       snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
  //   return userData;
  // }


  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F28),
      appBar: AppBar(
        backgroundColor: Color(0xFF003543),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountScreen()),
              );
            },
            icon: Icon(Icons.person),
            color: Colors.red,
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('User')
            .where('Email', isEqualTo: user?.email)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          oldName = snapshot.data?.docs[0]['Name'] ?? 'DefaultName';
          //strImage = snapshot.data?.docs[0]['imageLisk'];
          if (snapshot.hasData) {
            return Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    (snapshot.data?.docs[0]['imageLisk']).toString()
                                    //'https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI='
                                    ),
                              ),
                        Positioned(
                          child: IconButton(
                            onPressed: selectImage,
                            icon: Icon(Icons.add_a_photo, color: Colors.white,),
                          ),
                          bottom: -10,
                          left: 80,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text('Email: ', style: TextStyle(color: Colors.white),),
                        Expanded(
                          child: Center(
                            child: Text(
                              (snapshot.data?.docs[0]['Email']).toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Text((snapshot.data?.docs[0]['Email']).toString()),
                    Row(
                      children: [
                        Text('Name: ', style: TextStyle(color: Colors.white),),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: nameController,
                            decoration: InputDecoration(

                              hintText:
                                  (snapshot.data?.docs[0]['Name']).toString(),
                              hintStyle: TextStyle(color: Colors.white),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                                borderRadius: BorderRadius.circular(23),
                              ),

                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: saveProfile,
                      child: const Text('Save profile', style: TextStyle(fontSize: 16),),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    )

                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: snapshot.data!.docs.length,
                    //   itemBuilder: (context, index) => Container(
                    //     child: Center(
                    //       child: Text(
                    //         (snapshot.data?.docs[index]['Email']).toString(),
                    //         style: TextStyle(color: Colors.black),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Loading...',
                style: TextStyle(color: Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}
