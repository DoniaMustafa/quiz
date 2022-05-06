part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}
class QuizSuccessState extends QuizState {}
class HandelQuizSuccessState extends QuizState {}
class HandelSuccessState extends QuizState {}
class HandelErrorState extends QuizState {}
