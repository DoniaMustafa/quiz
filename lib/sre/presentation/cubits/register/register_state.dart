part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterErrorState extends RegisterState {

  FirebaseAuthException error;

  RegisterErrorState({required this.error});
}
class RegisterExceptionState extends RegisterState {}

class CreateUserLoadingState extends RegisterState {}
class CreateUserSuccessState extends RegisterState {}
class CreateUserErrorState extends RegisterState {}