import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'White', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'dog', 'score': 3},
        {'text': 'Snake', 'score': 15},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 8},
      ],
    },
    {
      'questionText': 'Who\'s your favourite Instructor?',
      'answers': [
        {'text': 'Max', 'score': 3},
        {'text': 'ALX', 'score': 2},
        {'text': 'FCC', 'score': 3},
        {'text': 'Oga Vin', 'score': 2},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('My APP')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                resultScore: _totalScore,
                resetQuiz: _resetQuiz,
              ),
      ),
    );
  }
}
