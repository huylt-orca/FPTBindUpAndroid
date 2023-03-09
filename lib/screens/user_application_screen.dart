import 'package:android/models/Application.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Application"),
      ),
      body: Container(),
    );
  }
}
