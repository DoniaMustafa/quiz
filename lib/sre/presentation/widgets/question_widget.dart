import 'package:flutter/material.dart';
import 'package:quiz_app/sre/data/models/questions_model.dart';

class QuestionWidget extends StatelessWidget {
  QuestionModel questionModel; void Function() function;
  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Text(
              "${questionModel.question}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
          ),
          for (int i = 0; i < questionModel.answers!.length; i++)
            Container(
              width: double.infinity,
              height: 50.0,
              margin: const EdgeInsets.only(bottom: 20.0, left: 12.0, right: 12.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusColor: Colors.blue,
                onPressed: function,
                child: Text(questionModel.answers!.keys.toList()[i]),
              ),
            )
        ],
      );
    }

  QuestionWidget({required this.questionModel,required this.function});
}
