import 'package:flutter/material.dart';

class ProjectOverviewScreen extends StatelessWidget {
  const ProjectOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Summary",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
            "the industry's standard dummy text ever since the 1500s"),
        SizedBox(height: 10,),
        
        Text("Jobs", style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold),),
        Text("- Developer")

      ],
    );
  }
}
