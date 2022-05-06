part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppSelectLanguageState  extends AppState {}
class AppLoadLocalState extends AppState {}
class SelectLanErrorState extends AppState {}
class SelectLanSuccessState extends AppState {}
class SetLanLoadingState extends AppState {}
class SetLanSuccessState extends AppState {}
class SetLanErrorState extends AppState {}