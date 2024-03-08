// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'text.dart';

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
      body: Container(
        // color: Colors.redAccent,
        alignment: Alignment.center,
        child: Stack(
          // alignment: AlignmentDirectional.topEnd,
          // alignment: AlignmentDirectional.topCenter,
          // alignment: Alignment.topRight,
          // alignment: Alignment.center,
          // alignment: Alignment.centerRight,
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              width: 400,
              height: 400,
              color: Colors.greenAccent,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText('Aaa', s),
                      MyText('Bbb', s),
                      MyText('Ccc', s),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText('Aaa', s),
                      MyText('Bbb', s),
                      MyText('Ccc', s),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // margin: const EdgeInsets.all(8)
        // margin: const EdgeInsets.fromLTRB(30, 10, 30, 8),
        // margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        // margin: const EdgeInsets.only(top: 10),
        // // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        // // padding: const EdgeInsets.only(top: 10, bottom: 10),
        // padding: const EdgeInsets.all(8.0),
        // // height: double.infinity,
        // // alignment: Alignment.center,
        // child: Row(
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: MyText(
        //           'Aaaa',
        //           s,
        //         )),
        //     Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: MyText(
        //           'Bbbb',
        //           s2,
        //         )),
        //   ],
        // ),
      ),
    );
  }
}
