part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class LoginAuthLoadingState extends AuthState {}
class LoginAuthSuccessState extends AuthState {}
class LoginAuthErrorState extends AuthState {}
class SignOutInitialSuccess extends AuthState {}
class FacebookLoadingState extends AuthState {}
class FacebookSuccessState extends AuthState {}
class FacebookErrorState extends AuthState {}
class GoogleLoadingState extends AuthState {}
class GoogleSuccessState extends AuthState {}
class GoogleErrorState extends AuthState {}