import 'package:flutter/material.dart';
// import 'main.dart';

// Update the Answers class to handle passing the score as an argument when the button is pressed
class Answers extends StatelessWidget {
  final String answerText;
  final Function()
      selectAnswer; // Adjust the function signature to accept an int parameter

  const Answers(this.selectAnswer, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: selectAnswer, // Pass the score as an argument
        child: Text(
          answerText,
          style: const TextStyle(
            fontSize: 25,
            // color: isSwitched == true ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
