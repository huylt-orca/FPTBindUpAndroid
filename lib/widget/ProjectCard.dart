import 'package:android/screens/project_detail_screen.dart';
import 'package:android/widget/ProjectTypeWidget.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final int voteQuantity =0;
  const ProjectCard(
      { Key? key,
        required this.name,
        required this.description,
        required this.image,
        voteQuantity
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
                      this.image,
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
                        this.name,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis ,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                      this.description,
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
                      Text("$voteQuantity")
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
