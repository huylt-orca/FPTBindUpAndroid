import 'package:android/widget/ChangeLogCard.dart';
import 'package:flutter/material.dart';

class ProjectChangelogScreen extends StatelessWidget {
  const ProjectChangelogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ChangeLogCard(
            title: "Title",
            description: "Description",
            time: "07:00, 12/03/2023",
          ),
          ChangeLogCard(
            title: "Title",
            description: "Description",
            time: "07:00, 12/03/2023",
          )
        ],
      ),
    );
  }
}
