import 'package:flutter/material.dart';

class PopupAddMentor extends StatefulWidget {
  const PopupAddMentor({Key? key}) : super(key: key);

  @override
  State<PopupAddMentor> createState() => _PopupAddMentorState();
}

class _PopupAddMentorState extends State<PopupAddMentor> {

  String keyword ="";

  void _runFilter (String value){

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Mentor'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                keyword=value;
                _runFilter(value);
              },
              decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search)
              ),
            ),
            const SizedBox(height: 100,
              child: Text(
                "Hello"
              ),
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
