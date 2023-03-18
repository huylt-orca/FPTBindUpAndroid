import 'package:flutter/material.dart';

class PopupAddMember extends StatefulWidget {
  const PopupAddMember({Key? key}) : super(key: key);

  @override
  State<PopupAddMember> createState() => _PopupAddMemberState();
}

class _PopupAddMemberState extends State<PopupAddMember> {
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
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(labelText: 'Role'),
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
