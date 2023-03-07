import 'package:android/controller/ProjectController.dart';
import 'package:android/widget/TabBarProject.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderProject extends StatelessWidget {

  const HeaderProject({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProjectController projectController = Get.put(ProjectController());
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    "${projectController.logo}",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,

                  ),
                ),
                Text(
                  "${projectController.name}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: Text(
                    "Go to Web",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Text(
                  "${projectController.description}",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // TabBarProject(),
        ],
      ),
    );
  }
}
