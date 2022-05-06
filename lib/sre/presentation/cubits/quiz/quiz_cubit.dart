import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/di.dart';

import '../../../data/data_helper/local/dynamic_data.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  int question_pos = 0;
  int score = 0;
  bool isPressed = false;
  PageController? controller;
  String next = "Next Question";
  bool answered = false;

  pageChange(int page) {
    if (page == questions.length - 1) {
      next = "See Results";
    }
    answered = false;
    emit(QuizSuccessState());
  }

  answersHandler(int index,int i){
    if (!di<QuizCubit>().answered) {
      if (questions[index].answers!.values.toList()[i]) {
        di<QuizCubit>().score++;
        print("yes");
      } else {
        print("no");
        // emit(HandelQuizSuccessState());
      }
        di<QuizCubit>().isPressed = true;
        di<QuizCubit>().answered = true;
      emit(HandelSuccessState());
    } else {
       null;
       emit(HandelErrorState());

    }
  }
}
