import 'package:artifitia_test/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUsecases {
  final AuthDomainRepo authDomainRepo;

  AuthUsecases(this.authDomainRepo);

  Future<User?> sigInWithGoogle() async {
    return await authDomainRepo.signInWithGoogle();
  }

  Future<User?> signInWithEmail(
      String email, String password, bool isNewUser) async {
    return await authDomainRepo.signInWithEmail(email, password, isNewUser);
  }

  Future<void> signOut() async {
    return await authDomainRepo.signOut();
  }
}
