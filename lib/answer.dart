import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressed;
  final String answerText;
  const Answer({Key key, @required this.onPressed, @required this.answerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(answerText),
      ),
    );
  }
}
