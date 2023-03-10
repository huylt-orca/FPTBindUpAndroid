import 'package:android/controller/ProjectController.dart';
import 'package:android/widget/ChangeLogCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectChangelogScreen extends StatefulWidget {
  const ProjectChangelogScreen({Key? key}) : super(key: key);

  @override
  State<ProjectChangelogScreen> createState() => _ProjectChangelogScreenState();
}

class _ProjectChangelogScreenState extends State<ProjectChangelogScreen> {
  ProjectController projectController = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          projectController.changelogs.length == 0 ?
              Center(child: Text('No Changelog'),) :
          Expanded(
              child: ListView.builder(
                itemCount: projectController.changelogs.length,
                  itemBuilder: (context,index){
                  return ChangeLogCard(
                    title: projectController.changelogs[index].title!,
                    description: projectController.changelogs[index].description!,
                    time: projectController.changelogs[index].createdDate!,
                  );
                  }
              )
          )
        ],
      ),
    );
  }
}
