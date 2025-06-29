import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDomainRepo {
  Future<User?> signInWithGoogle();
  Future<User?> signInWithEmail(String email, String password, bool isNewUser);
  Future signOut();
}
