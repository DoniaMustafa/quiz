import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/di.dart';
import 'package:quiz_app/sre/core/utils/constans.dart';
import 'package:quiz_app/sre/presentation/cubits/app/app_cubit.dart';
import 'package:quiz_app/sre/presentation/cubits/login/auth_cubit.dart';
import 'package:quiz_app/sre/presentation/screens/login_screen.dart';
import 'package:quiz_app/sre/presentation/screens/select_language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependency();

  appLangDirection = await getAppLangAndDir();
  String translateFile = await getTranslationFile(appLangDirection ?? 'en');
  // Widget start;
  // if (appLangDirection != null) {
  //   start = LoginScreen();
  // } else {
  //   start = SelectLanguage();
  // }

  runApp(MyApp(code: appLangDirection.toString(),translate:translateFile ));
}

class MyApp extends StatelessWidget {
  // final Widget widget;
  final String code;
  final String translate;
  MyApp({required this.translate, required this.code, });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<AuthCubit>()),
        BlocProvider(
            create: (context) => di<AppCubit>()
              ..setLanguage(translateFileJson: translate, code: code)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: di<AppCubit>().textDirection, child: SelectLanguage())
      ),
    );
  }
}
