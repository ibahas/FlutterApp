import 'package:flutter/material.dart';
import 'package:flutter_application_1/answer.dart';
import 'package:flutter_application_1/quesion.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int _selectedQuestion;
  final Function(int)
      answersQuestion; // Update the function type to accept an int parameter

  const Quiz(this.questions, this._selectedQuestion, this.answersQuestion,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[_selectedQuestion]['questionText']),
        ...(questions[_selectedQuestion]['answers']
                as List<Map<String, dynamic>>)
            .map((answer) {
          // Extracting the score from the answer map
          return Answers(() => answersQuestion(int.parse(answer['score'].toString())),
              answer['text'].toString());
        }),
      ],
    );
  }
}
