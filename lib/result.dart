import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int total;
  final Function() resetApp;

  const Result(this.resetApp, this.total, {super.key});

  String get resultsPhrase {
    String resultText;
    if (total >= 70) {
      resultText = 'You are awesome !';
    } else if (total >= 40) {
      resultText = 'Pretty likable!';
    } else {
      resultText = 'You are so  bad!';
    }
    return resultText;
  }
  
  String get resultText => resultsPhrase;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultText,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          TextButton(
            onPressed: resetApp,
            child: const Text('Reset the app.'),
          )
        ],
      ),
    );
  }
}
