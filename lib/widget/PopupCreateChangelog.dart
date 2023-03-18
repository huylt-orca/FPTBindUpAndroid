import 'package:flutter/material.dart';

class PopupCreateChangelog extends StatefulWidget {
  const PopupCreateChangelog({Key? key}) : super(key: key);

  @override
  State<PopupCreateChangelog> createState() => _PopupCreateChangelogState();
}

class _PopupCreateChangelogState extends State<PopupCreateChangelog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Changelog'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
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
          child: Text('Add'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
