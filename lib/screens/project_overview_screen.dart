import 'package:android/constants.dart';
import 'package:android/controller/ProjectController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/ProjectImage.dart';

class ProjectOverviewScreen extends StatelessWidget {
  // final List<String> imageUrls = imageUrlsDemo;
  const ProjectOverviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProjectController projectController = Get.put(ProjectController());
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: projectController.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 100,
                        child: Image.network(projectController.images[index].directory!, fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            Text("Summary",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            Text("this.summary!"),
            SizedBox(height: 10,),

            Text("Jobs", style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),),
            Text("- Developer")

          ],
        ),
      ),
    );
  }
}

