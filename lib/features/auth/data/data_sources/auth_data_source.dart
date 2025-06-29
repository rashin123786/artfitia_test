import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthDataSource {
  Future<User?> signInWithGoogle();
  Future<User?> signInWithEmail(String email, String password, bool isNewUser);
  Future signOut();
}

class AuthDataSourceImpl extends AuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithEmail(
      String email, String password, bool isNewUser) async {
    UserCredential result;
    if (isNewUser) {
      result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } else {
      result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    }

    return result.user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  @override
  Future signOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  // final GoogleSignInAuthentication getAuth = getUser.authentication;
  // final credentials = GoogleAuthProvider.credential(
  //   idToken: getAuth.idToken,
  // );

  // return await _firebaseAuth.signInWithCredential(credentials);
}
