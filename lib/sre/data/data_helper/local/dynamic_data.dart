import 'package:quiz_app/sre/data/models/questions_model.dart';

import '../../../core/utils/constans.dart';

List<QuestionModel> questions = [
  QuestionModel(
      question:translationModel.question1.toString(),
      answers:  {
      "100": false,
      "82": false,
      "38": true,
      "50": false,
      },),
  QuestionModel(
    question: translationModel.question2.toString(),
   answers:  {
      "90": false,
     "72": true,
     "60": false,
      "150": false,
    },
  ),
  QuestionModel(question: translationModel.question3.toString(), answers:{
    "Damascus": false,
    "Jeddah": false,
    "Khartoum": false,
    "Cairo": true,
  }),
  QuestionModel(question: translationModel.question4.toString(), answers:{
    "Noah": false,
    "Adam": true,
    "Ibrahim": false,
    "Yunus": false,
  }),
  QuestionModel(question:translationModel.question5.toString(),answers: {
    "1254": false,
    "500": false,
    "1743": true,
    "900": false,
  }),
  QuestionModel(question: translationModel.question6.toString(), answers:{
    "50": true,
    "68": false,
    "49": false,
    "15": false,
  }),
  QuestionModel(question:translationModel.question7.toString(),
      answers:  {
    "20": false,
    "18": false,
    "29": true,
    "10": false,
  }),
  QuestionModel(
     question:  translationModel.question8.toString(), answers: {
    "60": false,
    "48": false,
    "12": true,
    "84": false,
  }),
  QuestionModel(question: translationModel.question9.toString(),answers: {
    "500": false,
    "2000": false,
    "200": true,
    "2500": false,
  }),
  QuestionModel(
    question:   translationModel.question10.toString(),
      answers: {
        "3122": false,
        "233": false,
        "5202": true,
        "1000": false,
      }),

];
