import 'package:android/controller/ProjectController.dart';
import 'package:android/services/ProjectMemberService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PopupAddMember extends StatefulWidget {
  const PopupAddMember({Key? key}) : super(key: key);

  @override
  State<PopupAddMember> createState() => _PopupAddMemberState();
}

class _PopupAddMemberState extends State<PopupAddMember> {
  ProjectController projectController = Get.put(ProjectController());

  final formKey = GlobalKey<FormState>();
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtTitle = TextEditingController();
  TextEditingController _txtRole = TextEditingController();

  String? _validateName(String? value){
    if (value == null || value.isEmpty){
      return "Please enter Name";
    }
    return null;
  }

  String? _validateTitle(String? value){
    if (value == null || value.isEmpty){
      return "Please enter Title";
    }
    return null;
  }

  String? _validateRole(String? value){
    if (value == null || value.isEmpty){
      return "Please enter Role";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Member'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
               validator: _validateName,
              controller: _txtName,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              validator: _validateTitle,
              controller: _txtTitle,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              validator: _validateRole,
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
            if (formKey.currentState!.validate()){
              bool isSuccessful = await ProjectMemberService.postMemberToProject(_txtName.text, _txtTitle.text, _txtRole.text);
              if (isSuccessful){
                Fluttertoast.showToast(msg: "Add Member Successful");
                projectController.members = RxList(await ProjectMemberService.fetchMemberListByProjectId());
                Navigator.of(context).pop();
              } else {
                Fluttertoast.showToast(msg: "Add Member Failed");
              }
            }
          },
        ),
      ],
    );
  }
}
