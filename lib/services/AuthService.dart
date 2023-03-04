import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {

    print(email);
    print(password);

    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(userCredential);
    return userCredential;
  }

  Future<UserCredential> signInWithGoogle() async {

    // Đăng nhập bằng Google
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    // Lấy thông tin đăng nhập từ tài khoản Google
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;

    // Tạo credential từ thông tin đăng nhập Google
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    // Đăng nhập Firebase bằng credential
    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    return authResult;
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }

}