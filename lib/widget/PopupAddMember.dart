import 'package:android/services/ProjectMemberService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupAddMember extends StatefulWidget {
  const PopupAddMember({Key? key}) : super(key: key);

  @override
  State<PopupAddMember> createState() => _PopupAddMemberState();
}

class _PopupAddMemberState extends State<PopupAddMember> {

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtTitle = TextEditingController();
  TextEditingController _txtRole = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Member'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _txtName,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: _txtTitle,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: _txtRole,
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
          child: Text('Add'),
          onPressed: () async {
            bool isSuccessful = await ProjectMemberService.postMemberToProject(_txtName.text, _txtTitle.text, _txtRole.text);
            if (isSuccessful){
              Fluttertoast.showToast(msg: "Add Member Successful");
              Navigator.of(context).pop();
            } else {
              Fluttertoast.showToast(msg: "Add Member Failed");
            }

          },
        ),
      ],
    );
  }
}
