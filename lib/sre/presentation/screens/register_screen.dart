

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/di.dart';
import 'package:quiz_app/sre/config/toast/toast_msg.dart';
import 'package:quiz_app/sre/core/utils/constans.dart';
import 'package:quiz_app/sre/presentation/cubits/register/register_cubit.dart';
import 'package:quiz_app/sre/presentation/screens/login_screen.dart';
import 'package:quiz_app/sre/presentation/widgets/check_box.dart';
import 'package:quiz_app/sre/presentation/widgets/custom_button.dart';
import 'package:quiz_app/sre/presentation/widgets/custom_text_form.dart';

class RegisterScreen extends StatelessWidget {
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          children: [
            Form(key: globalKey, child: _buildSignUpTextForm()),
            const SizedBox(
              height: 20.0,
            ),
            const CustomCheckBox(),
            const SizedBox(
              height: 50.0,
            ),
            _buildSubmitBut()
          ],
        ),
      ),
    );
  }

  _buildSubmitBut() => BlocProvider(
        create: (context) => di<RegisterCubit>(),
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }
            if (state is RegisterErrorState) {
              if (state.error.code == 'weak-password') {
                showToast(
                    text: 'The password provided is too weak.',
                    tColor: ToastColors.ERROR);
                print('The password provided is too weak.');
              } else if (state.error.code == 'email-already-in-use') {
                showToast(
                    text: 'The account already exists for that email.',
                    tColor: ToastColors.ERROR);
                print('The account already exists for that email.');
              }
            }
          },
          child: CustomButton(
              text: translationModel.submit.toString(),
              onPress: () {
                if (globalKey.currentState!.validate()) {
                  di<RegisterCubit>().register(
                      email: di<RegisterCubit>().email.text,
                      pass: di<RegisterCubit>().pass.text,
                      name: di<RegisterCubit>().name.text,
                      phone: di<RegisterCubit>().phone.text,
                      confirm: true);
                }
              }),
        ),
      );
  _buildSignUpTextForm() => Column(
        children: [
          CustomTextForm(
              controller: di<RegisterCubit>().name,
              label: translationModel.registerName.toString(),
              icon: Icons.person,
              val: translationModel.validateRegisterName.toString()),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextForm(
            controller: di<RegisterCubit>().email,
            label: translationModel.registerEmail.toString(),
            icon: Icons.email,
            val: translationModel.validateLoginEmail.toString(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextForm(
            controller: di<RegisterCubit>().pass,
            label: translationModel.registerPassword.toString(),
            icon: Icons.lock,
            val: translationModel.validateLoginPassword.toString(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextForm(
              controller: di<RegisterCubit>().phone,
              label: translationModel.registerPhone.toString(),
              icon: Icons.phone,
              val: translationModel.validateRegisterPhone.toString()),
        ],
      );
}
