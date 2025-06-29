import 'package:artifitia_test/features/auth/data/data_sources/auth_data_source.dart';
import 'package:artifitia_test/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImplement implements AuthDomainRepo {
  final AuthDataSource authDataSource;

  AuthRepoImplement(this.authDataSource);
  @override
  Future<User?> signInWithEmail(
      String email, String password, bool isNewUser) async {
    return await authDataSource.signInWithEmail(email, password, isNewUser);
  }

  @override
  Future<User?> signInWithGoogle() async {
    return await authDataSource.signInWithGoogle();
  }

  @override
  Future signOut() async {
    return await authDataSource.signOut();
  }
}
