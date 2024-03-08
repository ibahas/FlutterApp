// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'text.dart';

// import 'package:flutter_application_1/lesson_three.dart';
// import 'package:flutter_application_1/lesson_one.dart';
// import 'package:flutter_application_1/lesson_two.dart';

void main() => runApp(const MyApp());

Color w = Colors.white;
Color b = Colors.black;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        title: Text(
          'AppBar title',
          style: TextStyle(
            color: b,
          ),
        ),
      ),
      //Rwo
      // body: Container(
      //   width: double.infinity,
      //   color: b,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     // crossAxisAlignment: CrossAxisAlignment.start,
      //     // crossAxisAlignment: CrossAxisAlignment.end,
      //     // crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       Text('Text 1xxxx', style: TextStyle(color: w, fontSize: 20)),
      //       MyText('Text 2', s20),
      //     ],
      //   ),
      // ),
      //Column
      body: Container(
        width: 300,
      //   width: double.infinity,
        color: b,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Text 1xxxx', style: TextStyle(color: w, fontSize: 20)),
            MyText('Text 2', s20),
          ],
        ),
      ),
    );
  }
}
