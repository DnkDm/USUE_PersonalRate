import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usue_app_rate2/mainapp/for_no_login.dart';
import 'package:usue_app_rate2/mainapp/for_login.dart';
import 'package:usue_app_rate2/router/router.dart';

import 'package:usue_app_rate2/screens/account_screen.dart';
import 'package:usue_app_rate2/screens/login_screen.dart';

@RoutePage()
class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F28),
      appBar: AppBar(
        title: Text("Rating"),
        backgroundColor: Color(0xFF003543),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('User')
            .orderBy('Rait', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => _itemGet(
                    (snapshot.data?.docs[index]['Name']).toString(),
                    (snapshot.data?.docs[index]['Rait']).toString(),
                    (snapshot.data?.docs[index]['imageLisk']).toString(),
                    (snapshot.data?.docs[index]['Email']).toString()));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _itemGet(String name, String rait, String img, String email) {
    return  GestureDetector(
      onTap: (){
        AutoRouter.of(context).push(PersonRoute(email: email, name: name, rait: rait, img: img));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(img),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                rait,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
        height: 60,
        decoration: BoxDecoration(
            color: Color(0xFF00677F), borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
