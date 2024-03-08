import 'package:flutter/material.dart';
import 'package:flutter_application_1/age_calculator.dart';

class LessonThree extends StatefulWidget {
  const LessonThree({super.key});

  @override
  State<StatefulWidget> createState() => _LessonThreeState();
}

class _LessonThreeState extends State<LessonThree> {
  bool passwordVisible = true;
  var b = Colors.black;
  var w = Colors.white;
  var r = Colors.red;
  var bl = Colors.blue;
  var g = Colors.green;
  var br = Colors.brown;
  var myController = TextEditingController();
  var age = 0;
  var msg = '';

  changeColors() {
    setState(() {
      b = b == Colors.black ? Colors.white : Colors.black;
      w = w == Colors.white ? Colors.black : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('App title'),
      ),
      body: Container(
        height: double.infinity,
        color: b,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    fillColor: b,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(width: 2, color: g),
                    ),
                    labelText: 'Your birth year :',
                    labelStyle: TextStyle(fontSize: 30, color: r),
                    hintText: 'Enter birthday year',
                    hintStyle: TextStyle(fontSize: 20, color: w),
                  ),
                  // maxLines: 6,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: w),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: IconButton(
                  // color: g,
                  padding: const EdgeInsets.all(10),
                  onPressed: () => {
                    setState(() {
                      var p = int.parse(myController.text);
                      AgeCalculator(p);
                      msg = AgeCalculator.msg;
                    }),
                  },
                  icon: Icon(
                    Icons.send,
                    color: w,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  msg,
                  style: TextStyle(color: w),
                ),
                // style: TextStyle(color: w),
                // ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: w,
        onPressed: () => changeColors(),
      ),
    );
  }
}
