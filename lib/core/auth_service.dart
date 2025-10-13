import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //sign in with google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await auth.signInWithCredential(credential);
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  // signout
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print('Error signing out user: $e');
    }
  }

  // get current user
  User? getCurrentUser() {
    return auth.currentUser;
  }

  // to check user is login or not
  Future<bool> isUserLoggedIn() async {
    return auth.currentUser != null;
  }
}
