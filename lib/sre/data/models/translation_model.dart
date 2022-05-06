// To parse this JSON data, do
//
//     final translationModel = translationModelFromJson(jsonString);

import 'dart:convert';

TranslationModel translationModelFromJson(String str) =>
    TranslationModel.fromJson(json.decode(str));

String translationModelToJson(TranslationModel data) =>
    json.encode(data.toJson());

class TranslationModel {
  TranslationModel({
    this.email,
    this.pass,
    this.login,
    this.signUp,
    this.or,
    this.validateLoginEmail,
    this.validateLoginPassword,
    this.signIn,
    this.submit,
    this.registerName,
    this.registerEmail,
    this.registerPassword,
    this.registerPhone,
    this.validateRegisterEmail,
    this.validateRegisterPassword,
    this.validateRegisterName,
    this.validateRegisterPhone,
    this.nextQuestion,
    this.seeResults,
    this.question,
    this.yes,
    this.no,
    this.question1,
    this.question2,
    this.question3,
    this.question4,
    this.question5,
    this.question6,
    this.question7,
    this.question8,
    this.question9,
    this.question10,
    this.selectTitle1,
    this.selectTitle2,
    this.done
  });
  final String? selectTitle1;
  final String? selectTitle2;

  final String? email;
  final String? pass;
  final String? login;
  final String? signUp;
  final String? or;
  final String? validateLoginEmail;
  final String? validateLoginPassword;
  final String? signIn;
  final String? submit;
  final String? registerName;
  final String? registerEmail;
  final String? registerPassword;
  final String? registerPhone;
  final String? validateRegisterEmail;
  final String? validateRegisterPassword;
  final String? validateRegisterName;
  final String? validateRegisterPhone;
  final String? nextQuestion;
  final String? seeResults;
  final String? question;
  final String? yes;
  final String? no;
  final String? question1;
  final String? question2;
  final String? question3;
  final String? question4;
  final String? question5;
  final String? question6;
  final String? question7;
  final String? question8;
  final String? question9;
  final String? question10;
  final String? done;

  factory TranslationModel.fromJson(Map<String, dynamic> json) => TranslationModel(
    selectTitle1: json["select_title"],
    email: json["email"],
    pass: json["pass"],
    login: json["login"],
    signUp: json["sign_up"],
    done: json["done"],
    or: json["or"],
    validateLoginEmail: json["validateLoginEmail"],
    validateLoginPassword: json["validateLoginPassword"],
    signIn: json["signIn"],
    submit: json["submit"],
    registerName: json["registerName"],
    registerEmail: json["registerEmail"],
    registerPassword: json["registerPassword"],
    registerPhone: json["registerPhone"],
    validateRegisterEmail: json["validateRegisterEmail"],
    validateRegisterPassword: json["validateRegisterPassword"],
    validateRegisterName: json["validateRegisterName"],
    validateRegisterPhone: json["validateRegisterPhone"],
    nextQuestion: json["nextQuestion"],
    seeResults: json["seeResults"],
    question: json["question"],
    yes: json["yes"],
    no: json["no"],
    question1: json["question1"],
    question2: json["question2"],
    question3: json["question3"],
    question4: json["question4"],
    question5: json["question5"],
    question6: json["question6"],
    question7: json["question7"],
    question8: json["question8"],
    question9: json["question9"],
    question10: json["question10"],
  );

  Map<String, dynamic> toJson() => {
    'select_title':selectTitle1,
    "done":done,
    "email": email,
    "pass": pass,
    "login": login,
    "sign_up": signUp,
    "or": or,
    "validateLoginEmail": validateLoginEmail,
    "validateLoginPassword": validateLoginPassword,
    "signIn": signIn,
    "submit": submit,
    "registerName": registerName,
    "registerEmail": registerEmail,
    "registerPassword": registerPassword,
    "registerPhone": registerPhone,
    "validateRegisterEmail": validateRegisterEmail,
    "validateRegisterPassword": validateRegisterPassword,
    "validateRegisterName": validateRegisterName,
    "validateRegisterPhone": validateRegisterPhone,
    "nextQuestion": nextQuestion,
    "seeResults": seeResults,
    "question": question,
    "yes": yes,
    "no": no,
    "question1": question1,
    "question2": question2,
    "question3": question3,
    "question4": question4,
    "question5": question5,
    "question6": question6,
    "question7": question7,
    "question8": question8,
    "question9": question9,
    "question10": question10,
  };
}
