import 'package:flutter/services.dart';
import 'package:quiz_app/di.dart';
import 'package:quiz_app/sre/data/data_helper/local/cach_helper.dart';
import 'package:quiz_app/sre/data/models/lang_model.dart';

import '../../data/models/translation_model.dart';
import '../../presentation/cubits/app/app_cubit.dart';

TranslationModel translationModel=di<AppCubit>().translationModel!;
String? appLangDirection  ;

List<LanguageModel> listLang = [
  LanguageModel(language: 'English', code: 'en'),
  LanguageModel(language: 'العربية', code: 'ar')
];

Future<dynamic> getAppLangAndDir() async {
  return await di<CacheHelper>().get('languageDir');
}
Future<String> getTranslationFile(String code) async {
  return await rootBundle.loadString('assets/translation/${code.toString() == null ?'en':code.toString()}.json');
}

Future<bool> setLangDirToShard(String setCode) async {
  appLangDirection = setCode;
  return await di<CacheHelper>().put('languageDir', setCode);
}