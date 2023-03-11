import 'package:android/constants.dart';
import 'package:android/controller/UserController.dart';
import 'package:android/widget/ProjectMemberCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ProjectController.dart';
import '../models/Member.dart';

class ProjectMemberScreen extends StatefulWidget {
  const ProjectMemberScreen({Key? key}) : super(key: key);

  @override
  State<ProjectMemberScreen> createState() => _ProjectMemberScreenState();
}

class _ProjectMemberScreenState extends State<ProjectMemberScreen> {
  ProjectController projectController = Get.put(ProjectController());
  UserController userController = Get.put(UserController());
  List<Member> members = List<Member>.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    members.add(new Member(
        id: projectController.founder.value.id,
        name: projectController.founder.value.name,
        title: projectController.founder.value.avatar ,
        role:  "Leader"
    ));
    projectController.mentors.forEach((mentor) {
      members.add(new Member(
          id: mentor.id,
          title: imageDemo,
          name: mentor.name,
          role: "Mentor"
      ));
    });
    projectController.members.forEach((member) {
      members.add(new Member(
          id: member.id,
          title: imageDemo,
          name: member.name,
          role: member.role
      ));
    });

    members.addAll(projectController.members);

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 300,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                  itemBuilder: (context,index){
                  String? tmpImage = members[index].title == "" ? imageDemo :members[index].title;
                    return ProjectMemberCard(name: members[index].name!, description: members[index].role!, image: tmpImage!);
                  }
              ),
            ),
          ],
        )
    );
  }
}
