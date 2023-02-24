import 'package:android/models/project.dart';
import 'package:android/widget/ProjectCard.dart';
import 'package:flutter/material.dart';

import '../callapi/apiproject.dart';

class ListViewProjectHome extends StatefulWidget {
  const ListViewProjectHome({Key? key}) : super(key: key);

  @override
  State<ListViewProjectHome> createState() => _ListViewProjectHomeState();
}

class _ListViewProjectHomeState extends State<ListViewProjectHome> {

  List<Project> list = List<Project>.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProjectRequest.fetchPosts().then((data){
      setState(() {
        list = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context,index){
          return ProjectCard(name: list[index].name!,
          description: list[index].description!,
          image: list[index].logo!,);
        },

      ),
    );
  }
}
