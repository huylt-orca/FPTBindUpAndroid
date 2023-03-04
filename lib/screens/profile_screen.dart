import 'package:android/screens/update_profile_screen.dart';
import 'package:android/screens/user_application_screen.dart';
import 'package:android/screens/user_change_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../widget/ProfileMenuWidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/profileavatar.jpg",
                  )
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text("Luu Thanh Huy",
            style: TextStyle(
                fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Text("Developer",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 200,
            child: TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                    UpdateProfileScreen(),
                  ),
                );
              } ,
              child: const Text("Edit Profile",
              style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          const Divider(),
          const SizedBox(height: 30,),

          ProfileMenuWidget(title: "Appication",
            icon: LineAwesomeIcons.pager,
            onPress: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    UserApplicationScreen(),
                ),
              );
            } ,
          ),
          ProfileMenuWidget(title: "Change password",
            icon: LineAwesomeIcons.alternate_pencil,
            onPress: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    ChangePasswordScreen(),
                ),
              );
            } ,
          ),
          ProfileMenuWidget(title: "Logout",
            icon: LineAwesomeIcons.alternate_sign_out,
            textColor: Colors.red,
            endIcon: false,
            onPress: (){},
          ),

        ],
      )
    );
  }


}


