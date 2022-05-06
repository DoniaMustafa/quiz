import 'package:get_it/get_it.dart';
import 'package:quiz_app/sre/data/data_helper/local/cach_helper.dart';
import 'package:quiz_app/sre/data/implement/auth_implement.dart';
import 'package:quiz_app/sre/domin/repository/auth_repo.dart';
import 'package:quiz_app/sre/presentation/cubits/app/app_cubit.dart';
import 'package:quiz_app/sre/presentation/cubits/login/auth_cubit.dart';
import 'package:quiz_app/sre/presentation/cubits/quiz/quiz_cubit.dart';
import 'package:quiz_app/sre/presentation/cubits/register/register_cubit.dart';
import 'package:quiz_app/sre/presentation/cubits/select_lan/select_lan_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt di = GetIt.instance..allowReassignment = true;
Future<void> initializeDependency() async {
  final shared = await SharedPreferences.getInstance();

  di.registerLazySingleton<SharedPreferences>(
    () => shared,
  );
  di.registerLazySingleton<CacheHelper>(() => CacheImp(
        di<SharedPreferences>(),
      ));

  di.registerLazySingleton<AuthRepository>(() => AuthImplement());
  di.registerLazySingleton<AuthCubit>(
      () => AuthCubit(authRepository: di<AuthRepository>()));
  di.registerLazySingleton<RegisterRepository>(() => RegisterImplement());
  di.registerSingleton<AppCubit>(AppCubit());

  di.registerLazySingleton<RegisterCubit>(
      () => RegisterCubit(registerRepository: di<RegisterRepository>()));
  di.registerLazySingleton<QuizCubit>(() => QuizCubit());
  di.registerFactory<SelectLanCubit>( ()=>SelectLanCubit());

}
