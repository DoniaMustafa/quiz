import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/sre/config/toast/toast_msg.dart';
import 'package:quiz_app/sre/core/utils/constans.dart';

import '../../../domin/repository/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());
  AuthRepository authRepository;


   userLogin(
      {required String emailAddress, required String password})  {
    emit(LoginAuthLoadingState());
   authRepository.login(email: emailAddress,pass: password)
        .then((value) {
      debugPrint(value.user!.email);
      emit(LoginAuthSuccessState());
    }).onError((FirebaseAuthException error, stackTrace) {
      if (error.code == 'user-not-found') {
        showToast(text: 'No user found for that email.', tColor: ToastColors.ERROR);
        print('No user found for that email.');
      } else if (error.code == 'wrong-password') {
        showToast(text: 'Wrong password provided for that user.', tColor: ToastColors.WARNING);
        print('Wrong password provided for that user.');
      }
      emit(LoginAuthSuccessState());
    }).catchError((onError) {
      emit(LoginAuthSuccessState());
    });
  }


  Future<UserCredential?> signInWithFacebook() async {
    // Trigger the sign-in flow
    emit(FacebookLoadingState());
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return  FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((value) {
      // userModel=value.user;
      debugPrint(value.user!.displayName);

      emit(FacebookSuccessState());

    }).catchError((onError){
      debugPrint(onError.toString());

      emit(FacebookErrorState());

    });
  }

  Future<void>signOut()async{
    await FirebaseAuth.instance.signOut();
    emit(SignOutInitialSuccess());
  }

  Future<UserCredential?> signInWithGoogle() async {
     emit(GoogleLoadingState());
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      print(value.user!.displayName);
      emit(GoogleSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GoogleErrorState());
    });

  }

}
