import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_application_1/lesson_three.dart';
// import 'package:flutter_application_1/lesson_one.dart';
// import 'package:flutter_application_1/lesson_two.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Text(
          'AppBar title',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body:  Container(
        color: Colors.redAccent,
        // margin: const EdgeInsets.all(8)
        // margin: const EdgeInsets.fromLTRB(30, 10, 30, 8),
        // margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        margin: const EdgeInsets.only(top: 10),
        // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        // padding: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.all(8.0),
        // height: double.infinity,
        // alignment: Alignment.center,
        child: const Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Aaaaa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Bbbbb',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
