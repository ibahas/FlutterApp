import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz.dart';
import 'package:flutter_application_1/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

bool isSwitched = false;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Question selected.
  var _selectedQuestion = 0;
  var _totalScore = 0;

  //Reset app.
  void resetApp() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  void answersQuestion(int score) {
    _totalScore += score;
    setState(() {
      _selectedQuestion += 1;
    });
  }

  //Questions, Answers
  final List<Map<String, Object>> questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 20,
        },
        {
          'text': 'White',
          'score': 30,
        },
        {
          'text': 'Blue',
          'score': 40,
        },
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 10,
        },
        {
          'text': 'Tiger',
          'score': 20,
        },
        {
          'text': 'Elephant',
          'score': 30,
        },
        {
          'text': 'Lion',
          'score': 40,
        },
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [
        {
          'text': 'Ibrahim1',
          'score': 10,
        },
        {
          'text': 'Ibrahim2',
          'score': 20,
        },
        {
          'text': 'Ibrahim3',
          'score': 30,
        },
        {
          'text': 'Ibrahim4',
          'score': 40,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white38,
          title: const Text('Quiz app'),
          shadowColor: Colors.greenAccent,
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (val) {
                setState(() {
                  isSwitched = val;
                });
              },

              inactiveThumbColor: Colors.black,
              // inactiveTrackColor: Colors.black,
              activeTrackColor: Colors.black,
              activeColor: Colors.white,
              ),
          ],
        ),
        body: Container(
          color: isSwitched == true ? Colors.black : Colors.white,
          child: _selectedQuestion != questions.length
              ? Quiz(questions, _selectedQuestion,
                  answersQuestion as Function(int))
              : Result(resetApp, _totalScore),
        ) // Correct casting
        );
  }
}
