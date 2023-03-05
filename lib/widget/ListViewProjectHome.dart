import 'package:android/models/project.dart';
import 'package:android/widget/ProjectCard.dart';
import 'package:flutter/material.dart';

import '../api/apiproject.dart';

class ListViewProjectHome extends StatefulWidget {
  const ListViewProjectHome({Key? key}) : super(key: key);

  @override
  State<ListViewProjectHome> createState() => _ListViewProjectHomeState();
}

class _ListViewProjectHomeState extends State<ListViewProjectHome> {
final scrollController = ScrollController();
  List<Project> list = List<Project>.empty(growable: true);
  int page =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(_scrollListener);
    ProjectRequest.fetchPosts().then((data){
      setState(() {
        list = data;
      });
    });
  }

  void _runFilter (String value){

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(Icons.search)
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (context,index){
                return ProjectCard(name: list[index].name!,
                description: list[index].description!,
                image: list[index].logo!,);
              },

            ),
          ),
        ],
      ),
    );
  }

  void _scrollListener(){
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent){
      this.page++;
      ProjectRequest.fetchPosts(page: this.page).then((data){
        setState(() {
          list.addAll(data);
        });
      });
    }
  }
}
