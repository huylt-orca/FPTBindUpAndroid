import 'package:android/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  AuthService authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                     Center(
                         child: Text("BindUp",
                         style: TextStyle(
                           fontSize: 52,
                          fontWeight: FontWeight.bold,
                         ),
                         )),
                    const SizedBox(height: 20,),
                    Text("Welcome",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    
                    Form(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _txtEmail,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline_outlined),
                                  labelText: "Username",
                                  hintText: "Username",
                                  border: OutlineInputBorder()
                                ),
                              ),
                              const SizedBox(height: 30,),
                              TextFormField(
                                obscureText: true,
                                controller: _txtPassword,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.fingerprint),
                                    labelText: "Password",
                                    hintText: "Password",
                                    border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.remove_red_eye_sharp)
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: (){},
                                  child: const Text('Forgot Password?'),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        String token = await authService
                                                      .signInWithEmailAndPassword(
                                            _txtEmail.text,
                                            _txtPassword.text
                                        );
                                        print(token);

                                        // UserCredential userCredential =
                                        // await authService
                                        //     .signInWithEmailAndPassword(
                                        //     _txtEmail.text
                                        //     , _txtPassword.text
                                        // );
                                        print('success');
                                      }catch (error){
                                        print('failed');
                                      }
                                    },
                                    child: Text('LOGIN',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),)
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("OR"),
                        const SizedBox(height: 10,),

                        OutlinedButton(
                            onPressed: () async{
                              try{
                                UserCredential userCredential = await authService.signInWithGoogle();
                                print(userCredential);
                                print('Successful');

                              } catch(error){
                                print(error);
                              }
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.g_mobiledata_outlined,color: Colors.black,),
                                Text('Sign-in with Google',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(onPressed: () async{
                      await authService.signOut();
                    },
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an Account?",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: " Sign up",
                                style: TextStyle(color: Colors.blue)
                              )
                            ]
                          )
                        )
                    )
                  ],
                ),
            ),
          )
      ),
    );
  }
}