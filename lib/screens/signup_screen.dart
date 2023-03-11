import 'package:android/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../controller/UserController.dart';
import '../models/User.dart';
import '../services/AuthService.dart';
import '../services/StorageService.dart';
import '../services/UserService.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  TextEditingController _txtUsername = TextEditingController();
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtPhone = TextEditingController();
  int _gender = 0;
  AuthService authService = new AuthService();
  List<String> genders = ["Male", "Female"];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: BackButton(color: Colors.black),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                      child: Text("BindUp",
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const SizedBox(height: 20,),
                  Text("Sign Up",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20,),

                  Form(
                      child:Column(
                        children: [
                          TextFormField(
                            controller: _txtUsername,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person_outline_outlined),
                                labelText: "Username",
                                hintText: "Username",
                            ),
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            obscureText: true,
                            controller: _txtPassword,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.fingerprint),
                              labelText: "Password",
                              hintText: "Password",
                              suffixIcon: IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.remove_red_eye_sharp)
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            controller: _txtName,
                            decoration: const InputDecoration(
                                label: Text("Fullname"),
                                hintText: "Fullname",
                                prefixIcon: Icon(LineAwesomeIcons.male)
                            ),
                          ),
                          const SizedBox(height: 20),
                          DropdownButtonFormField<String>(
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
                              contentPadding: EdgeInsets.only(left: 20),
                              labelText: 'Gender',
                            ),
                          ),

                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _txtEmail,
                            decoration: const InputDecoration(
                                label: Text("Email"),
                                hintText: "Email",
                                prefixIcon: Icon(LineAwesomeIcons.envelope)
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _txtPhone,
                            decoration: const InputDecoration(
                                label: Text("Phone"),
                                hintText: "Phone",
                                prefixIcon: Icon(LineAwesomeIcons.phone)
                            ),
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () async{
                                try {
                                  String token = await authService
                                      .registerAccount(
                                      username:  _txtUsername.text,
                                      password: _txtPassword.text,
                                      email: _txtEmail.text,
                                      fullname: _txtName.text,
                                      gender: this._gender,
                                      phone: _txtPhone.text
                                  );
                                  StorageService.saveAccessToken(token);

                                  User user = await UserService.fetchUserDetail();

                                  final UserController userController = Get.put(UserController());

                                  userController.AddUser(user);

                                  Navigator.pop(context);

                                  print('success');
                                }catch (error){
                                  print('failed');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide.none, shape: const StadiumBorder()
                              ),
                              child: const Text ("Sign Up",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(onPressed: () async{
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                              child: Text.rich(
                                  TextSpan(
                                      text: "Already have an Account?",
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: " Login",
                                            style: TextStyle(color: Colors.blue)
                                        )
                                      ]
                                  )
                              )
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
