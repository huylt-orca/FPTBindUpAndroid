import 'package:android/constants.dart';
import 'package:android/screens/project_application_screen.dart';
import 'package:android/screens/project_changelog_screen.dart';
import 'package:android/screens/project_member_screen.dart';
import 'package:android/screens/project_milestones_screen.dart';
import 'package:android/screens/project_overview_screen.dart';
import 'package:flutter/material.dart';

class TabBarProject extends StatefulWidget {
  const TabBarProject({Key? key}) : super(key: key);

  @override
  State<TabBarProject> createState() => _TabBarProjectState();
}

class _TabBarProjectState extends State<TabBarProject> {
  List<String> tabProject = ["Overview", "Milestones","Member", "Changelog", "Application"];
  int selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    ProjectOverviewScreen(),
    ProjectMilestonesScreen(currentStepProject: 1),
    ProjectMemberScreen(),
    ProjectChangelogScreen(),
    ProjectApplicationScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: tabProject.length,
                itemBuilder: (context,index) =>
                    buildTab(index),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: _widgetOptions[selectedIndex],
          )
        ],
      ),
    );
  }

  Widget buildTab (int index){
    return GestureDetector(
      onTap: () {
        setState(() {
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

