part of 'select_lan_cubit.dart';

@immutable
abstract class SelectLanState {}

class SelectLanInitial extends SelectLanState {}
class SelectLanErrorState extends SelectLanState {}
class SelectLanSuccessState extends SelectLanState {}
class SetLanLoadingState extends SelectLanState {}
class SetLanSuccessState extends SelectLanState {}
class SetLanErrorState extends SelectLanState {}
