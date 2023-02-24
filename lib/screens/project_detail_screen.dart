import 'package:android/screens/header_project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ProjectDetailScreen extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  const ProjectDetailScreen(
      { Key? key,
        required this.name,
        required this.description,
        required this.image,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        // IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   color: kTextColor,
        //   onPressed: (){},
        // ),
      ),
      body: HeaderProject(
        name: this.name,
        description: this.description,
        image: this.image,
      ),
    );
  }
}
