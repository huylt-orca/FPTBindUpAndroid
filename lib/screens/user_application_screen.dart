import 'package:flutter/material.dart';

class UserApplicationScreen extends StatelessWidget {
  const UserApplicationScreen({Key? key}) : super(key: key);

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
