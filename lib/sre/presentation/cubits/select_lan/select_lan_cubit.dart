import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/di.dart';
import 'package:quiz_app/sre/config/toast/toast_msg.dart';
import 'package:quiz_app/sre/core/utils/constans.dart';
import 'package:quiz_app/sre/data/models/lang_model.dart';
import 'package:quiz_app/sre/presentation/cubits/app/app_cubit.dart';
import 'package:quiz_app/sre/presentation/screens/login_screen.dart';

part 'select_lan_state.dart';

class SelectLanCubit extends Cubit<SelectLanState> {
  SelectLanCubit() : super(SelectLanInitial());
  // int selectedLanguage = di<AppCubit>().selectLanguageIndex!.toInt();


}
