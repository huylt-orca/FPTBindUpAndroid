import 'dart:convert';

import 'package:android/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  static final String urlAuth = server + "auth/";


  Future<String> signInWithEmailAndPassword(String email, String password) async {
    var uri = Uri.parse(urlAuth);
    var body = jsonEncode({
      'username': email,
      'password': password,

    });
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      var response = await http.post(uri, body: body, headers: headers);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print(responseData['token']);
        return responseData['token'];
      } else {

        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Xử lý lỗi khi không kết nối được đến API hoặc khi có lỗi trong quá trình gửi yêu cầu
      print('Error: $error');
    }
    return'';
  }

  Future<UserCredential> signInWithEmailAndPassword1(String email, String password) async {

    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(userCredential);
    return userCredential;
  }

  Future<UserCredential> signInWithGoogle() async {


    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;


    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );


    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    return authResult;
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }

}