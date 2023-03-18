import 'package:flutter/material.dart';

class PopupAddJob extends StatefulWidget {
  const PopupAddJob({Key? key}) : super(key: key);

  @override
  State<PopupAddJob> createState() => _PopupAddJobState();
}

class _PopupAddJobState extends State<PopupAddJob> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Apply Job'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Apply'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
