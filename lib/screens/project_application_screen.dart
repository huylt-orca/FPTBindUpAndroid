import 'package:android/constants.dart';
import 'package:android/controller/ProjectController.dart';
import 'package:android/widget/ProjectMemberCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/PopupAddJob.dart';

class ProjectApplicationScreen extends StatefulWidget {
  const ProjectApplicationScreen({Key? key}) : super(key: key);

  @override
  State<ProjectApplicationScreen> createState() => _ProjectApplicationScreenState();
}

class _ProjectApplicationScreenState extends State<ProjectApplicationScreen> {
  ProjectController projectController = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return  PopupAddJob();
                      },
                    );
                  },
                  child: Text('Create' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )
              )
            ],
          ),

          projectController.applications.length == 0 ?
              Center(child: Text('No Applications'),) :
          Expanded(
            child: ListView.builder(
                itemCount: projectController.applications.length,
                itemBuilder: (context,index) {
                return ProjectMemberCard(
                    name: projectController.applications[index].id!,
                    description: projectController.applications[index].description!,
                    image: imageDemo,
                    isOwner: true,
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
