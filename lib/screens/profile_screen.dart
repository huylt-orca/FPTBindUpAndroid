import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRect(
              child: const Image(image: AssetImage("")),
            ),
          ),
          const SizedBox(height: 10,),
          Text("Name", style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}
