import 'package:android/constants.dart';
import 'package:android/controller/ProjectController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           projectController.images.length !=0
            ? SizedBox(
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
            )
            : SizedBox(height: 0,),
            Text("Description",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            Html(
                data: projectController.description.value
            ),
            SizedBox(height: 10,),

            projectController.jobs.length != 0 ?
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jobs", style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,),),
                      ElevatedButton(
                          onPressed: (){},
                          child: Text('Apply Job' ,
                            style: TextStyle(
                                color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          )
                      )
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                        itemCount: projectController.jobs.length,
                          itemBuilder: (context,index){
                            return Text(projectController.jobs[index].name!);
                          })
                  ),
                ],
              ),
            )
            :  SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}


