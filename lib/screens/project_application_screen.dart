import 'package:android/constants.dart';
import 'package:android/widget/ProjectMemberCard.dart';
import 'package:flutter/material.dart';

class ProjectApplicationScreen extends StatelessWidget {
  const ProjectApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProjectMemberCard(
              name: "Thanh Huy",
              description: "Develop",
              image: imageDemo,
              isOwner: true,
          ),
        ],
      ),
    );
  }
}
