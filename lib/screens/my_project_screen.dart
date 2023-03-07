import 'package:android/api/apiproject.dart';
import 'package:android/api/callapitest.dart';
import 'package:android/models/test.dart';
import 'package:android/models/Project.dart';
import 'package:flutter/material.dart';

import '../widget/TarBarMyProject.dart';

class MyProjectScreen extends StatelessWidget {
  const MyProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Text("My Product"),
      child:  TabBarMyProject(),
    );
  }
  

}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  // List<Test> list = List<Test>.empty(growable: true);
  List <Project> projects = List<Project>.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProjectRequest.fetchPosts().then((data) {
      setState(() {
        print(data.length);
        projects = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${projects[index].name}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    projects[index].description!,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey
                    ),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}