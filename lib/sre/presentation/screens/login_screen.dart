import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/di.dart';
import 'package:quiz_app/sre/presentation/cubits/login/auth_cubit.dart';
import 'package:quiz_app/sre/presentation/screens/questions_screen.dart';
import 'package:quiz_app/sre/presentation/screens/register_screen.dart';
import 'package:quiz_app/sre/presentation/widgets/custom_text_form.dart';
import 'package:quiz_app/sre/presentation/widgets/custon_icon_circle_widget.dart';

import '../../core/utils/constans.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final finalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(key: finalKey, child: _buildTextForm()),
            const SizedBox(
              height: 30.0,
            ),
            _buildLoginButton(),
            const SizedBox(
              height: 30.0,
            ),
            Text(translationModel.or.toString()),
            const SizedBox(
              height: 20.0,
            ),
            Text(translationModel.signIn.toString()),
            SizedBox(height: 20.0,),
            _buildSignWith(),
            const SizedBox(
              height: 30.0,
            ),
            CustomButton(
              text: translationModel.signUp.toString(),
              onPress: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen())),
            ),
          ],
        ),
      ),
    );
  }

  _buildSignWith() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconCircleWidget(
              iconData: Icons.facebook,
              onTap: () => di<AuthCubit>().signInWithFacebook()),
          SizedBox(width: 20.0,),
          CustomIconCircleWidget(
            iconData: Icons.alternate_email,
            onTap: () => di<AuthCubit>().signInWithGoogle(),
          )
        ],
      );
  _buildLoginButton() => BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginAuthSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QuestionScreen()));
          }
        },
        child: CustomButton(
          text: translationModel.login.toString(),
          onPress: () {
            if (finalKey.currentState!.validate()) {
              di<AuthCubit>()
                  .userLogin(emailAddress: email.text, password: pass.text);
            }
          },
        ),
      );
  _buildTextForm() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextForm(
              controller: email,
              label: translationModel.email.toString(),
              icon: Icons.email,
              val: translationModel.validateLoginEmail.toString()),
          CustomTextForm(
              controller: pass,
              label: translationModel.pass.toString(),
              icon: Icons.lock,
              val: translationModel.validateLoginPassword.toString()),
        ],
      );
}
