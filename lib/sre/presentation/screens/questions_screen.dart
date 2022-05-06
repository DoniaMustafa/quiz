import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/di.dart';
import 'package:quiz_app/sre/data/data_helper/local/dynamic_data.dart';
import 'package:quiz_app/sre/presentation/cubits/quiz/quiz_cubit.dart';
import 'package:quiz_app/sre/presentation/screens/result_screen.dart';
import 'package:quiz_app/sre/presentation/widgets/custom_button.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
    di<QuizCubit>().controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252c4a),
      body: BlocProvider(
        create: (context) => di<QuizCubit>(),
        child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: PageView.builder(
              controller: di<QuizCubit>().controller!,
              onPageChanged: (page) => di<QuizCubit>().pageChange(page),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildQuestionPage(index),
              itemCount: questions.length,
            )),
      ),
    );
  }

  _buildQuestionPage(int index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(index),
          const Divider(
            color: Colors.white,
          ),
          const SizedBox(
            height: 10.0,
          ),
          _buildQuestionTitle(index),
          for (int i = 0; i < questions[index].answers!.length; i++)
            _buildAnswers(index, i),
          const SizedBox(
            height: 40.0,
          ),
          _buildNextBut()
        ],
      );
  _buildTitle(int index) => SizedBox(
        width: double.infinity,
        child: Text(
          "Question ${index + 1}/10",
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      );
  _buildQuestionTitle(int index) => SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Text(
          "${questions[index].question}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
          textAlign: TextAlign.center,
        ),
      );
  _buildAnswers(int index, int i) {
    return Container(
      width: double.infinity,
      height: 50.0,
      margin: const EdgeInsets.only(bottom: 20.0, left: 12.0, right: 12.0),
      child: BlocBuilder<QuizCubit, QuizState>(
  builder: (context, state) {
    return CustomButton(
        color: di<QuizCubit>().isPressed
            ? questions[index].answers!.values.toList()[i]
                ? Colors.green
                : Colors.red
            : Colors.blue,
        onPress: () =>di<QuizCubit>().answersHandler(index,i),
        text: questions[index].answers!.keys.toList()[i],
      );
  },
),
    );
  }

  _buildNextBut() => CustomButton(
        onPress: () {
          if (di<QuizCubit>().controller!.page?.toInt() ==
              questions.length - 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(di<QuizCubit>().score)));
          } else {
            di<QuizCubit>().controller!.nextPage(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInExpo);

            setState(() {
              di<QuizCubit>().isPressed = false;
            });
          }
        },
        text: di<QuizCubit>().next,
      );
}
