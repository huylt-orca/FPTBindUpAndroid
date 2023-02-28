import 'package:android/widget/TabBarProject.dart';
import 'package:flutter/material.dart';

class HeaderProject extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  const HeaderProject(
      { Key? key,
        required this.name,
        required this.description,
        required this.image,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
      padding: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
      Image.network(
      this.image,
      width: 120,
      height: 120,
      fit: BoxFit.cover,
    ),
    Text(
    this.name,
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    TextButton(
    child: Text("Go to Web",
    style: TextStyle(
    color: Colors.white
    ),
    ),
    onPressed: (){},
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
    padding: MaterialStateProperty.all<EdgeInsets>(
    EdgeInsets.symmetric(horizontal: 24,vertical: 8)
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    ),
    ),
    ),
    ),
    Text(this.description,textAlign: TextAlign.center,
      ),


    ],
    ),
    ),
        TabBarProject(),
      ],
    );
  }
}
