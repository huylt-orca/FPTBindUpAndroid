import 'package:android/controller/ProjectController.dart';
import 'package:android/services/JobService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PopupAddJob extends StatefulWidget {
  const PopupAddJob({Key? key}) : super(key: key);

  @override
  State<PopupAddJob> createState() => _PopupAddJobState();
}

class _PopupAddJobState extends State<PopupAddJob> {

  TextEditingController _txtTitle = TextEditingController();
  TextEditingController _txtDescription = TextEditingController();
  ProjectController projectController = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Job'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _txtTitle,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextFormField(

              controller: _txtDescription,
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
          child: Text('Create'),
          onPressed: () async {
            if (_txtTitle.text.trim().length == 0 || _txtDescription.text.trim().length == 0){
              Fluttertoast.showToast(
                  msg: "Create Job Failed",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey[600],
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            } else{
              Fluttertoast.showToast(
                  msg: "Create Job Successful",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey[600],
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              await JobService.postJob(_txtTitle.text, _txtDescription.text);
              projectController.jobs = RxList(await JobService.fetchJobList());
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
