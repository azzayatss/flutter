import 'package:lerningdart/services/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;

  Future<AuthUser> logIn({
    required String email,
    required String password,
  }); 

  Future<AuthUser> createUser({
    required String email,
    required String password,
  }); 

  Future<void> logOut();

  Future<void> sendEmailVerification();
  //!! закінчив тут (chapter24 vandad 34:30)
}