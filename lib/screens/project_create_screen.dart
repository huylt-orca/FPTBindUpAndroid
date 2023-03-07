import 'package:android/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Create Project",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: const Image(
                        image: AssetImage("assets/images/profileavatar.jpg"
                    )),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: mCustomMainColor
                        ),
                        child:  Icon(
                          LineAwesomeIcons.camera,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Form(
                  child:Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Project Name"),
                            prefixIcon: Icon(LineAwesomeIcons.male)
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Description"),
                            prefixIcon: Icon(LineAwesomeIcons.envelope)
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Summary"),
                            prefixIcon: Icon(LineAwesomeIcons.map)
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Topic"),
                            prefixIcon: Icon(LineAwesomeIcons.genderless)
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Headline"),
                            prefixIcon: Icon(LineAwesomeIcons.book)
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Phone"),
                            prefixIcon: Icon(LineAwesomeIcons.phone)
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: (){

                          },
                          style: ElevatedButton.styleFrom(
                              side: BorderSide.none, shape: const StadiumBorder()
                          ),
                          child: const Text ("Edit",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}