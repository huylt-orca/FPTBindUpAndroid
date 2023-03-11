import 'package:android/constants.dart';
import 'package:android/models/Application.dart';
import 'package:flutter/material.dart';

import '../widget/ApplicationCard.dart';

class UserApplicationScreen extends StatefulWidget {
  const UserApplicationScreen({Key? key}) : super(key: key);

  @override
  State<UserApplicationScreen> createState() => _UserApplicationScreenState();
}

class _UserApplicationScreenState extends State<UserApplicationScreen> {
  List<Application> applications =
  List<Application>.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    List<String> list = ['1','2','3','4','5','6','7','8'];
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Application"),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index) {
            return ApplicationCard(
              id: "",
              name: "Project Name",
              job: "Dev",
              status: "Pending",
              image: imageDemo
            );
          }
      ),
    );
  }
}
