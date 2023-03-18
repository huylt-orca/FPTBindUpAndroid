import 'package:flutter/material.dart';

class PopupApplyJob extends StatefulWidget {
  const PopupApplyJob({Key? key}) : super(key: key);

  @override
  State<PopupApplyJob> createState() => _PopupApplyJobState();
}

class _PopupApplyJobState extends State<PopupApplyJob> {

  List<String> genders = ["male","female"];
  int _gender = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Apply Job'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: genders[_gender],
              items: genders.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (String? value){
                if (value =="Female"){
                  this._gender = 1;
                }
                if (value == "Male"){
                  this._gender = 0;
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 0),
                labelText: 'Jobs',
              ),
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
          child: Text('Apply'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
