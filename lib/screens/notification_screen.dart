import 'package:android/constants.dart';
import 'package:android/models/responsetest.dart';
import 'package:android/widget/NotificationCard.dart';
import 'package:android/widget/TabBarProject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/ChangeLogCard.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<ResponseTest> list = listTest;
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index) {
        return NotificationCard(
            title: list[index].title!,
            description: list[index].description!,
            image: list[index].link!,
            time: list[index].createdDate!
        );
      },
    );
      //   NotificationCard(
      //   title: "Title",
      //   description: "Description",
      //   image: "https://firebasestorage.googleapis.com/v0/b/fptproducthunt.appspot.com/o/imageFour.gif?alt=media&token=4b9438d2-9521-49bc-abd4-28cd4f8cefdb",
      //   time: "07:00, 12/03/2023",
      // ),

  }





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
