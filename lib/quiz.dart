import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  const Quiz(
      {Key key,
      @required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(
                  onPressed: () => answerQuestion(answer['score']),
                  answerText: answer['text'],
                ))
      ],
    );
  }
}
