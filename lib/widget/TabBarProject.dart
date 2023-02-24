import 'package:android/constants.dart';
import 'package:flutter/material.dart';

class TabBarProject extends StatefulWidget {
  const TabBarProject({Key? key}) : super(key: key);

  @override
  State<TabBarProject> createState() => _TabBarProjectState();
}

class _TabBarProjectState extends State<TabBarProject> {
  List<String> tabProject = ["Overview", "Milestones","Member", "Changelog", "Application"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: tabProject.length,
            itemBuilder: (context,index) =>
                buildTab(index),
        ),
      ),
    );
  }

  Widget buildTab (int index){
    return GestureDetector(
      onTap: () {
        setState(() {
          print(index);
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                tabProject[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor: kTextLightColor
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:5),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

}

