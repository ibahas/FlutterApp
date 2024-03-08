import 'package:flutter/material.dart';

class LessonTwo extends StatefulWidget {
  const LessonTwo({super.key});

  @override
  State<StatefulWidget> createState() => _LessonTwoState();
}

class _LessonTwoState extends State<LessonTwo> {
  var c = Colors.orange;
  var index = 1;

  buttonOnPressed(){
   return setState(() {
      c = Colors.teal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c,
      ),
      body: null,
      floatingActionButton:  FloatingActionButton(
        onPressed: () => buttonOnPressed(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
