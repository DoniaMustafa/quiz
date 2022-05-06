import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/sre/domin/repository/auth_repo.dart';

final user = FirebaseAuth.instance;
FirebaseFirestore fireStore = FirebaseFirestore.instance;

class AuthImplement implements AuthRepository {
  @override
  Future<UserCredential> login(
      {required String email, required String pass}) async {
    return await user.signInWithEmailAndPassword(email: email, password: pass);
  }
}

class RegisterImplement implements RegisterRepository {
  @override
  Future<UserCredential> signUp({
    required String email,
    required String pass,
  }) async {
    return await user.createUserWithEmailAndPassword(
        email: email, password: pass);
  }

  @override
  Future<void> createUser(
      {required String name,
      required String phone,
      required String email,
      required String pass,
      required bool confirm}) async {
    await fireStore.collection('users').doc(user.currentUser!.uid).set({
      'email': email,
      'password': pass,
      'name': name,
      'confirm': confirm,
      'phone': phone
    });
  }
}
