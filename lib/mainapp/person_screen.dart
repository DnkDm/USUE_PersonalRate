import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usue_app_rate2/router/router.dart';

@RoutePage()
class PersonScreen extends StatefulWidget {
  const PersonScreen(
      {super.key,
      required this.email,
      required this.img,
      required this.name,
      required this.rait});

  final String email;
  final String img;
  final String name;
  final String rait;

  @override
  State<PersonScreen> createState() => _PersonScr();
}

class _PersonScr extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    //final argument = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color(0xFF003543),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios, // add custom icons also
          ),
        ),
      ),
      body: Center(
        child: IntrinsicHeight(
          child: Container(
            //color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 32),
            padding: EdgeInsets.symmetric(horizontal: 0),
            //width: 300,

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(widget.img),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Text(
                    'Описание о себе, я программист любитеь, моя сфера это молбильная разработка. Два года назад я начинал программировать на  java под Android, и ровно год двигался в этом направление. Сечас решил перейти на Fluttr ',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF001F28),
    );
  }
}
