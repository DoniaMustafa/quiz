import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/di.dart';
import 'package:quiz_app/sre/config/toast/toast_msg.dart';
import 'package:quiz_app/sre/core/utils/constans.dart';
import 'package:quiz_app/sre/data/models/lang_model.dart';
import 'package:quiz_app/sre/data/models/translation_model.dart';
import 'package:quiz_app/sre/presentation/screens/login_screen.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  TranslationModel? translationModel;
  TextDirection textDirection = TextDirection.ltr;

  List<bool> itemLang = [false, false];
  int? selectLanguageIndex;

   changeSelectLanguage(int index) {
    selectLanguageIndex = index;
    for (int i = 0; i < itemLang.length; i++) {
      if (i == index) {
        itemLang[i] = true;
      } else {
        itemLang[i] = false;
      }
    }
    emit(AppSelectLanguageState());
  }

 setLanguage({String? translateFileJson, String? code})  {
    translationModel = translationModelFromJson(translateFileJson!);
    textDirection = code == 'ar' ? TextDirection.rtl : TextDirection.ltr;
    emit(AppLoadLocalState());
  }
  selectLanConfig(context){
    if (selectLanguageIndex == null) {
      showToast(
          text: 'please enter your Language',
          tColor: ToastColors.WARNING);
      emit(SelectLanErrorState());
    } else {
      var model = listLang[selectLanguageIndex!];
      print(model.code);
      setLangDirToShard(model.code!).then((value) {
        getTranslationFile(model.code!)
            .then((value) {
          setLanguage(
              translateFileJson: value, code: model.code);
          emit(SetLanSuccessState());
        })
            .catchError((error) {
          (SetLanErrorState());
        })
            .then((value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
                  (Route<dynamic> route) => false);
          emit(SetLanSuccessState());

        })
            .catchError((error) {});
      }).catchError((error) {});
    }
  }
  setLangDir(LanguageModel model,context){
    // emit(SetLanLoadingState());


  }

}
