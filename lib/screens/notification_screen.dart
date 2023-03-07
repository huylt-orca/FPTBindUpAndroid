
import 'package:android/constants.dart';
import 'package:android/models/responsetest.dart';
import 'package:android/widget/NotificationCard.dart';
import 'package:android/widget/TabBarProject.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../widget/ChangeLogCard.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<RemoteMessage> _messages =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _messages = [message,..._messages];
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    if (_messages.isEmpty){
      return const Text("No Notification");
    }

    return ListView.builder(
        itemCount: _messages.length,
          itemBuilder: (context,index){
          RemoteMessage message = _messages[index];

        return NotificationCard(
            title: message.notification?.title ?? "",
            description: message.notification?.body ?? "",
            image: message.notification?.android?.imageUrl.toString() ?? imageDemo,
            time: message.sentTime!.toString()
        );
      },

    );
    
  }

  // @override
  // Widget build(BuildContext context) {
  //   List<ResponseTest> list = listTest;
  //   return ListView.builder(
  //     itemCount: list.length,
  //     itemBuilder: (context,index) {
  //       return NotificationCard(
  //           title: list[index].title!,
  //           description: list[index].description!,
  //           image: list[index].link!,
  //           time: list[index].createdDate!
  //       );
  //     },
  //   );
  //
  // }

  Widget listView(){
    return ListView.separated(
        itemBuilder: (context,index){
          return listViewItem(index);
        },
        separatorBuilder: (context,index){
          return Divider(height: 0);
        },
        itemCount: 15
    );
  }

  Widget listViewItem(int index){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded (
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeAndDate()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prefixIcon(){
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300
      ),
      child: Icon(Icons.notifications,size: 25,color: Colors.grey.shade300,),
    );
  }

  Widget message(int index){
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Message",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          children:[
            TextSpan(
              text: "Message Description",
              style: TextStyle(
                fontWeight: FontWeight.w400,
              )
            )
          ]
        ),
      ),
    );
  }

  Widget timeAndDate(){
    return Container(
       margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              '01-01-2024',
            style: TextStyle(
              fontSize: 10
            ),
          ),
          Text(
            '07: 00 am',
            style: TextStyle(
                fontSize: 10
            ),
          ),
        ],
      ),
    );
  }
}
