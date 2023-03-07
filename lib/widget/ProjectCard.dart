import 'package:android/constants.dart';
import 'package:android/controller/ProjectController.dart';
import 'package:android/models/Project.dart';
import 'package:android/models/ProjectImage.dart';
import 'package:android/screens/project_detail_screen.dart';
import 'package:android/services/ProjectService.dart';
import 'package:android/widget/ProjectTypeWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard(
      { Key? key,
        required this.project
      }) : super(key: key);

  String? _getImage(){
    return this.project.logo != "" ? this.project.logo : imageDefault;
  }

  @override
  Widget build(BuildContext context) {
    final ProjectController projectController = Get.put(ProjectController());
    return GestureDetector(
      onTap: ()async{
        print(this.project.id);
        Project projectDetail = await ProjectService.fetchProjectDetail(this.project.id!);
        projectController.AddProject(projectDetail);
        List<ProjectImage> images = await ProjectService.fetchProjectImageList(this.project.id!);
        projectController.AddListImage(images);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
             ProjectDetailScreen()
          )
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5), 
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black,
            width: 1,
            style: BorderStyle.solid
          )
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      this._getImage()!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.project.name!,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis ,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                      this.project.name!,
                     style: TextStyle(fontSize: 12),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis ,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ProjectTypeWidget(text: "Topic",boxColor: Colors.deepOrange),
                          ProjectTypeWidget(text: "Topic",boxColor: Colors.blue, textColor: Colors.red,),
                          ProjectTypeWidget(text: "Topic"),
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
            Positioned(
                right: 0,
                top: 30,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey) ,
                  ),
                  onPressed: () {  },
                  child: Column(

                    children: [
                      Icon(Icons.arrow_drop_up),
                      Text(this.project.voteQuantity.toString())
                    ],
                  )
                )
            ),
          ],
        ),
      ),
    );
  }
}