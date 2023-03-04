import 'package:android/constants.dart';
import 'package:flutter/material.dart';

class ProjectOverviewScreen extends StatelessWidget {
  const ProjectOverviewScreen({Key? key}) : super(key: key);
  final List<String> imageUrls = imageUrlsDemo;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 100,
                        child: Image.network(imageUrls[index], fit: BoxFit.cover)),
                  );
                },
              ),
            ),
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
        ),
      ),
    );
  }
}


