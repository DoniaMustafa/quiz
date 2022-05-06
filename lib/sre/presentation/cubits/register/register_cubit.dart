import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/sre/core/utils/constans.dart';
import '../../../config/toast/toast_msg.dart';
import '../../../domin/repository/auth_repo.dart';

import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepository}) : super(RegisterInitial());
  RegisterRepository registerRepository;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();

  register({
    required String email,
    required String pass,
    required String name,
    required String phone,
    required bool confirm,
  }) {
    emit(RegisterLoadingState());
    registerRepository.signUp(email: email, pass: pass).then((value) {
      emit(RegisterSuccessState());
    }).onError((FirebaseAuthException error, stackTrace) {
      createUser(
          email: email, pass: pass, name: name, confirm: confirm, phone: phone);
      emit(RegisterErrorState(error: error));
    }).catchError((e) {
      print(e);
      emit(RegisterExceptionState());
    });
  }

  createUser(
      {required String name,
      required bool confirm,
      required String email,
      required String pass,
      required String phone}) {
    emit(CreateUserLoadingState());
    registerRepository
        .createUser(
            name: name,
            phone: phone,
            email: email,
            pass: pass,
            confirm: confirm)
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState());
    });
  }
}
