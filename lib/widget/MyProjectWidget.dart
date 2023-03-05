import 'package:android/constants.dart';
import 'package:android/models/responsetest.dart';
import 'package:android/screens/project_create_screen.dart';
import 'package:android/widget/MyProjectCard.dart';
import 'package:flutter/material.dart';

class MyProjectWidget extends StatefulWidget {
  final bool isOwner ;
  const MyProjectWidget({Key? key, this.isOwner =false }) : super(key: key);

  @override
  State<MyProjectWidget> createState() => _MyProjectWidgetState();
}

class _MyProjectWidgetState extends State<MyProjectWidget> {
  List<ResponseTest> list = List<ResponseTest>.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      list = listTest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: this.widget.isOwner,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                      onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                CreateProjectScreen(),
                            ),
                          );
                      },
                      child: Text("Create"),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index){
                  return MyProjectCard(
                      name: list[index].title!,
                      description: list[index].description!,
                      image: list[index].link!
                  );
                  // return Text(list[index].title!);
                },

            ),
          ),
        ],
      ),
    );
  }
}
