import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> login({required String email, required String pass});
}


abstract class RegisterRepository {
  Future<UserCredential> signUp({
    required String email,
    required String pass,
  });

  Future<void> createUser({
    required String name,
    required String phone,
    required String email,
    required String pass,
    required bool confirm,
  });
}
