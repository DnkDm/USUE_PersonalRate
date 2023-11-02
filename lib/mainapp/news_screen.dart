import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usue_app_rate2/mainapp/for_news/news.dart';
import 'package:usue_app_rate2/mainapp/for_no_login.dart';
import 'package:usue_app_rate2/mainapp/for_login.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:usue_app_rate2/screens/account_screen.dart';
import 'package:usue_app_rate2/screens/login_screen.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News"), backgroundColor: Color(0xFF003543),),
      backgroundColor: Color(0xFF001F28),
      body: ListView.custom(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return _itemNews(newses[index].newstext, newses[index].imgnews);
          },
          childCount: newses.length,
          // findChildIndexCallback: (Key key) {
          //   final ValueKey valueKey = key as ValueKey;
          //   final String data = valueKey.value;
          //   return stories.indexOf(data as Story);
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor: Colors.red,
      //   currentIndex: _selectedPageIndex,
      //   onTap: _openPage,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.data_exploration), label: 'rating'),
      //     BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'news'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle_rounded), label: 'acc'),
      //   ],
      // ),
    );
  }

  Widget _itemNews (String text, String img){
    return Container(

      decoration: BoxDecoration(
          color: Color(0xFF00677F),
          borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          //Image.network(img, height: 150,fit:BoxFit.fill),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.network(
                img,

                fit: BoxFit.cover

            ),
          ),
          SizedBox(height: 10.0,),
          Text(text, style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
