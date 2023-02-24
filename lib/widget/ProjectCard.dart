import 'package:android/screens/project_detail_screen.dart';
import 'package:android/widget/ProjectTypeWidget.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  const ProjectCard(
      { Key? key,
        required this.name,
        required this.description,
        required this.image
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              ProjectDetailScreen(
            name: this.name,
            description: this.description,
            image: this.image,)),
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
        child: Row(
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
                  this.image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis ,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                  this.description,
                 style: TextStyle(fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis ,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ProjectTypeWidget(text: "Hello",boxColor: Colors.deepOrange),
                      ProjectTypeWidget(text: "And",boxColor: Colors.blue, textColor: Colors.red,),
                      ProjectTypeWidget(text: "Bye"),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
