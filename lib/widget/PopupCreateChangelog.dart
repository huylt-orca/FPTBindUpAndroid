import 'package:android/services/ChangeLogService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupCreateChangelog extends StatefulWidget {
  const PopupCreateChangelog({Key? key}) : super(key: key);

  @override
  State<PopupCreateChangelog> createState() => _PopupCreateChangelogState();
}

class _PopupCreateChangelogState extends State<PopupCreateChangelog> {
  TextEditingController _txtTitle = TextEditingController();
  TextEditingController _txtDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Changelog'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _txtTitle,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10,),
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
          onPressed: () async{
            if (_txtTitle.text.trim().length == 0 || _txtDescription.text.trim().length == 0){
              Fluttertoast.showToast(
                  msg: "Create Changelog Failed",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey[600],
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            } else{
              bool isSuccessful =  await ChangelogService.postChangelog(_txtTitle.text, _txtDescription.text);
              if (isSuccessful) {
                Fluttertoast.showToast(
                    msg: "Create Changelog Successful",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey[600],
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                Navigator.of(context).pop();
              } else {
                Fluttertoast.showToast(msg: "Create Changelog Failed");
              }
            }
          },
        ),
      ],
    );
  }
}
